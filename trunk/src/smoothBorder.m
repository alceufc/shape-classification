% sigmaFactor is used to compute the std. deviation (sigma) of the gaussian filter using the following expression:
%     sigma = sigmaFactor * N, where N is the number of points in the border.
%
function [ newX, newY ] = smoothBorder(X, Y, sigmaFactor)
    % Get the frequency signal of the border.
    F = extractBorderFreqSignal(X, Y);
    F = fftshift(F);
    originalSum = sum(abs(F));
    
    % Multiply the frequency signal by a gaussian of std. deviation of 'sigma'.
    K = - (floor(size(X)/2) - 1) : ceil(size(X)/2);
    K = K';
    
    sigma = size(X, 1) * sigmaFactor;
    sig2 = sigma^2;
    filter = 1/(2*pi*sig2).* exp((-K.^2)/(2*sig2));
    
    % Use the IFFT to get the smoothed border.
    F = ifftshift(F .* filter);
    filteredSum = sum(abs(F));
    
    energyConservationFactor = originalSum / filteredSum;
    
    F = energyConservationFactor .* F;
    
    S = ifft(F);
    newX = real(S);
    newY = imag(S);
end