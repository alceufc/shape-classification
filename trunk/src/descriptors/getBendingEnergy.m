function [ e ] = getBendingEnergy( X, Y )
    K = extractCurvature(X,Y);
    e = sum(K.^2);
end

