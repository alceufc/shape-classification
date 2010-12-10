% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
% Given the (x,y) coordinates of the border, extractBorderFreqSignal returns the DFT coeficients of the border signal.
% The border signal is obtained by the following expression:
%    s(n) = x + j*y, where j = sqrt(-1)
%
function [ F ] = extractBorderFreqSignal( X, Y )
    S = X + j*Y;

    F = fft(S);
end

