function [ xc, yc ] = getCenterOfMass( X, Y )
    xc = sum(X) / size(X,1);
    yc = sum(Y) / size(Y,1);
end

