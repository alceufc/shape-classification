% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ isBckg ] = isBackground(pixelValue)
    isBckg = (pixelValue == 255 || pixelValue == 1);
end