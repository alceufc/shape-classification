function [ e ] = getBendingEnergy( X, Y )
    k = extractCurvature(X,Y);
    e = sum(k.^2);
end

