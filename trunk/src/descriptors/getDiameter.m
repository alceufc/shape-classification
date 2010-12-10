% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
% Return the maximum distance between two points in the border.
function [ diameter ] = getDiameter(X, Y)
    diameter = - 1;
    for i = 1 : size(X, 1)
        for j = 1 : size(X, 1)
            d = (X(i) - X(j))^2 + (Y(i) - Y(j))^2;
            if d > diameter
                diameter = d;
            end;
        end;
    end;

    diameter = sqrt(diameter);
end

