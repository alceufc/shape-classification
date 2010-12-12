% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ confusionMatrix, class ] = classifierParametricBayesian( query )
    %Input:
    %  query = sample matrix
    %  group = class
    %Output 
    %  class:  1='ag'; 2='bg'; 3='cg'; 4='lg'; 5='me'; 6='pe'
    %
    
    dataSetMatrix = generateDataSetMatrix();
    [~, col] = size(dataSetMatrix);
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    group = dataSetMatrix(:,col);
    
    featureMatrix = zscore(featureMatrix);
    query = zscore(query);
    
    O1 = NaiveBayes.fit(featureMatrix, group);
    distancesMatrix = O1.predict(query);
    [confusionMatrix class] = confusionmat (group, distancesMatrix);
    
end