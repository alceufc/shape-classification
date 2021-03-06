% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ featureMatrix ] = generateFeatureMatrix( dataSetMatrix )
    featureCellMatrix = dataSetMatrix(:, 1 : size(dataSetMatrix, 2) - 1);
   
    featureMatrix = zeros(size(featureCellMatrix));
    for attr = 1 : size(featureMatrix, 2)
        featureMatrix(:, attr) = cat(2, featureCellMatrix{:, attr});
    end;

end