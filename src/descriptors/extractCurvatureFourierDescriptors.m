% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ F ] = extractCurvatureFourierDescriptors( X, Y )
    addpath('../');
    features = 21;

    K = extractCurvature(X,Y);
    F = abs(fftshift(fft(K)));
    
    % Pad the matrix to allow reshaping.
    F(size(F, 1) + (features - mod(size(F, 1), features))) = 0;

    % Reshape the matrix so that the number of columns matches the
    % value given by the input paramter 'features'.
    F = sum(reshape(F, size(F, 1) / features, features));
end
