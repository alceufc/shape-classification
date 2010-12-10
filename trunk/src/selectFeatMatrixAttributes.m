% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ newFeatMatrix ] = selectFeatMatrixAttributes(featureMatrix, attrIndexes)
   newFeatMatrix =  featureMatrix(:, attrIndexes);
end