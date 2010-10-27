function k = curvature()

% % % % % % % % % % % % % % % % %
%                               %
%           dxd2y - d2xdy       %
%  k(t) = -----------------     %
%         (dx^2 + dy^2)^3/2     %
%                               %
% % % % % % % % % % % % % % % % %
img = imread('C:\Users\frizzi\Desktop\bg1.tif');
[x,y] = extractBorder(img);

% first derivative
sigma = 10;
t = 1:size(x); % ?
dx = derivative(sigma,x,t);
dy = derivative(sigma,y,t);

% second derivative
d2x = derivative(sigma,dx,t);
d2y = derivative(sigma,dy,t);

% Calculating the curvature k
k = ( dx.*d2y - dy.*d2x )./( dx.^2 + dy.^2 ).^(3/2);
plot(k);




