function [ centroidMatrix ] = generateCentroidMatrix(  )
    addpath('../');
    %classes = ['ag'; 'bg'; 'cg'; 'lg'; 'me'; 'pe'];   
    
    dataSetMatrix = generateDataSetMatrix();
    
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    featureMatrix = zscore(featureMatrix);
    
    [fx, fy] = size(featureMatrix);
    
    %inicializando matrix
    matrix_ag = zeros(fx,fy); ag = 1;
    matrix_bg = zeros(fx,fy); bg = 1;
    matrix_cg = zeros(fx,fy); cg = 1;
    matrix_lg = zeros(fx,fy); lg = 1;
    matrix_me = zeros(fx,fy); me = 1;
    matrix_pe = zeros(fx,fy); pe = 1;
    
    %divide matrix
    for i=1:fx
        if strcmp(dataSetMatrix(i,fy+1),'ag')
            matrix_ag(ag,:) = featureMatrix(i,:);
            ag = ag+1;
        elseif strcmp(dataSetMatrix(i,fy+1),'bg')
            matrix_bg(bg,:) = featureMatrix(i,:);
            bg = bg+1;
        elseif strcmp(dataSetMatrix(i,fy+1),'cg')
            matrix_cg(cg,:) = featureMatrix(i,:);
            cg = cg+1;
        elseif strcmp(dataSetMatrix(i,fy+1),'lg')
            matrix_lg(lg,:) = featureMatrix(i,:);
            lg = lg+1;
        elseif strcmp(dataSetMatrix(i,fy+1),'me')
            matrix_me(me,:) = featureMatrix(i,:);
            me = me+1;
        elseif strcmp(dataSetMatrix(i,fy+1),'pe')
            matrix_pe(pe,:) = featureMatrix(i,:);
            pe = pe+1;
        end
    end
    
    matrix_ag = matrix_ag(1:ag-1,1:fy);
    matrix_bg = matrix_bg(1:bg-1,1:fy);
    matrix_cg = matrix_cg(1:cg-1,1:fy);
    matrix_lg = matrix_lg(1:lg-1,1:fy);
    matrix_me = matrix_me(1:me-1,1:fy);
    matrix_pe = matrix_pe(1:pe-1,1:fy);

    centroidMatrix(1,:) = extractCentroidClass(matrix_ag);
    centroidMatrix(2,:) = extractCentroidClass(matrix_bg);
    centroidMatrix(3,:) = extractCentroidClass(matrix_cg);
    centroidMatrix(4,:) = extractCentroidClass(matrix_lg);
    centroidMatrix(5,:) = extractCentroidClass(matrix_me);
    centroidMatrix(6,:) = extractCentroidClass(matrix_pe);
    
end