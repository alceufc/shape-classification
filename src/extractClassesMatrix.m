% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ classesMatrix ] = extractClassesMatrix(dataSetMatrix)
    classes = dataSetMatrix(:, size(dataSetMatrix,2));
    classesMatrix = unique(classes);
end