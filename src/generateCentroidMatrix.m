function [ centroidMatrix ] = generateCentroidMatrix(  )
    
    %@ATTRIBUTE class  {ag, bg, cg, lg, me, pe}
    classes = ['ag'; 'bg'; 'cg'; 'lg'; 'me'; 'pe'];   
    
    dataSetMatrix = generateDataSetMatrix();
    
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    featureMatrix = zscore(featureMatrix);
    
    [fx, fy] = size(featureMatrix);
    
    %class1 = featureMatrix(find(featureMatrix{:,fy}=='ag'),1:fy-1);
    for()
    
    %%%%%%%%%%%
    
    %[mx, my] = size(matrix);
    
    %cluster = matrix(1:mx-1,);
    
end