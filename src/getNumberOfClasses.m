% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%

function [ numberOfClasses ] = getNumberOfClasses(dataSetMatrix)
    classes = dataSetMatrix(:, size(dataSetMatrix,2));
    numberOfClasses = numel(unique(classes));
end