% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ e ] = getBendingEnergy( X, Y )
    K = extractCurvature(X,Y);
    e = sum(K.^2);
end

