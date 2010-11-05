function [ npeaks ] = getNumberPeaks( X, Y )
    addpath('../');
    
    k = extractCurvature(X,Y);
    k = conv(k, ones(10, 1), 'same');
    
    der = diff(k);

    % Count the number of peaks.
    zeroCross = false(size(der));
    for i = 1 : size(zeroCross, 1) - 1
        zeroCross(i) = (der(i) < 0 && der(i+1) >= 0) || (der(i) > 0 && der(i+1) <= 0) ;
    end;
    
    npeaks = numel(find(zeroCross));

end

