% imgFileName is the path to the segmented image file. The image file must have only one object.
function [ descriptors ] = extractDescriptorsFromImg( imgFileName )
    addpath('./descriptors');
    
    img = imread(imgFileName);
    
    img = preprocessInputImage(img);
    [X, Y] = extractBorder(img);
    [X, Y] = smoothBorder(X, Y, 0.2);
    
    area = getArea(img);
    diameter = getDiameter(X, Y);
    perimeter = getPerimeter(X, Y);
    bendingEnergy = getBendingEnergy(X, Y);  
    [centerOfMassX, centerOfMassY] = getCenterOfMass(X, Y);
    numberOfPeaks = getNumberPeaks(X, Y);
    fd = extractFourierDescriptors(X, Y);
    
    descriptors = cat(2, area, diameter, perimeter, bendingEnergy, centerOfMassX, centerOfMassY, numberOfPeaks, fd);
end

