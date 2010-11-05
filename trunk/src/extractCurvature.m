function k = curvature(X, Y)

% % % Curvature % % % % % % % % 
%                               
%           dxd2y - d2xdy       
%  k(t) = -----------------     
%         (dx^2 + dy^2)^3/2     
%                               
% % % % % % % % % % % % % % % % 


% first derivative
sigma = 0.2;
t = 1:size(X);

dx = derivative(sigma,X,t);
dy = derivative(sigma,Y,t);

% second derivative
d2x = derivative(sigma,dx,t);
d2y = derivative(sigma,dy,t);

% Calculating the curvature k
k = ( dx.*d2y - dy.*d2x )./( dx.^2 + dy.^2 ).^(3/2);

end