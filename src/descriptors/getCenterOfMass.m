% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ xc, yc ] = getCenterOfMass( X, Y )
    xc = sum(X) / size(X,1);
    yc = sum(Y) / size(Y,1);
end

