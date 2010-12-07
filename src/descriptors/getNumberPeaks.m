function [ npeaks ] = getNumberPeaks( X, Y )
    addpath('../');
    
    K = extractCurvature(X,Y);
    %K = conv(K, ones(10, 1), 'same');
    
    DiffK = diff(K);

    % Count the number of peaks.
    zeroCross = false(size(DiffK));
    for i = 1 : size(zeroCross, 1) - 1
        zeroCross(i) = (DiffK(i) < 0 && DiffK(i+1) >= 0) || (DiffK(i) > 0 && DiffK(i+1) <= 0) ;
    end;
    
    npeaks = numel(find(zeroCross));
end

