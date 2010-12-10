% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ isBckg ] = isObject(pixelValue)
    isBckg = (pixelValue == 0);
end
