% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
% Since the border of the image may have been smoothed, the assumption that the distance between two points in the
% border is 1 does not holds. This function computes the perimeter by computing and summing the distance between every 
% two consecutives points.
function [ perimeter ] = getPerimeter( X, Y )
    perimeter = 0.0;
    
    for point = 1 : size(X,1) - 1;
        perimeter = perimeter + sqrt((X(point) - X(point + 1))^2 + (Y(point) - Y(point + 1))^2);
    end;
    
    lastPoint = size(X,1);
    perimeter = perimeter + sqrt((X(1) - X(lastPoint))^2 + (Y(1) - Y(lastPoint))^2);

end

