% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ K ] = extractCurvature(X, Y)

% % % Curvature % % % % % % % % 
%                               
%           dxd2y - d2xdy       
%  k(t) = -----------------     
%         (dx^2 + dy^2)^3/2     
%                               
% % % % % % % % % % % % % % % % 

dx = diff(X);
d2x = diff(dx);
dx = dx(1 : size(d2x, 1));

dy = diff(Y);
d2y = diff(dy);
dy = dy(1 : size(d2y, 1));

% Resize dx and dy so that the number of elements is the same as for d2x and d2y.

% Calculating the curvature k
K = ( dx .* d2y - dy .* d2x )./( dx.^2 + dy.^2 ).^(3/2);
end