% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ confusionMatrix, class ] = classifierParametricBayesian( query, group )
    %Input:
    %  query = sample matrix
    %  group = class
    %Output 
    %  class:  1='ag'; 2='bg'; 3='cg'; 4='lg'; 5='me'; 6='pe'
    %
    
    dataSetMatrix = generateDataSetMatrix();
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    
    featureMatrix = zscore(featureMatrix);
    query = zscore(query);
    
    [fx, fy] = size(featureMatrix);
    
    %initialize
    matrix_ag = zeros(fx,fy); ag = 1;
    matrix_bg = zeros(fx,fy); bg = 1;
    matrix_cg = zeros(fx,fy); cg = 1;
    matrix_lg = zeros(fx,fy); lg = 1;
    matrix_me = zeros(fx,fy); me = 1;
    matrix_pe = zeros(fx,fy); pe = 1;
    
    %split
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
    
    %distance
    distancesMatrix(:,1) = ParametricBayesian(matrix_ag(1:ag-1,1:fy),query);
    distancesMatrix(:,2) = ParametricBayesian(matrix_bg(1:bg-1,1:fy),query);
    distancesMatrix(:,3) = ParametricBayesian(matrix_cg(1:cg-1,1:fy),query);
    distancesMatrix(:,4) = ParametricBayesian(matrix_lg(1:lg-1,1:fy),query);
    distancesMatrix(:,5) = ParametricBayesian(matrix_me(1:me-1,1:fy),query);
    distancesMatrix(:,6) = ParametricBayesian(matrix_pe(1:pe-1,1:fy),query);
    
    %classify
    [dmx, ~] = size(distancesMatrix);
    grouphat = zeros(1,dmx);
    
    for j=1:dmx
         [~, Pos] = max(distancesMatrix(j,:));
         grouphat(j) = Pos;
    end
    
    [confusionMatrix class] = confusionmat(group,grouphat);
          
end

function d = ParametricBayesian(A, B)
    % Return parametric Bayesian distance of two data matrices 
    
    [~, k1]=size(A);
    [n2, ~]=size(B);
    
    [mu,sigma] = normfit(A);
    
    for i=1:n2
        d(i) = exp((-0.5 * (B(i,:)-mu).*(sigma)*(B(i,:)-mu)')) /  (2*pi)^(k1/2) * sqrt(norm(sigma));    
    end
    
    
end









