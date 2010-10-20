% imgFileName is the path to the segmented image file. The image file must have only one object.
function [ descriptors ] = extractDescriptorsFromImg( imgFileName )
    addpath('./descriptors');
    
    img = imread(imgFileName);
    
    img = preprocessInputImage(img);
    [X,Y] = extractBorder(img);
    descriptors = extractFourierDescriptors(X, Y);
end

