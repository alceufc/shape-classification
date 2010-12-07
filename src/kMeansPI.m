% Each line of clusterMatrix corresponds to an instance (image). The first column is the instance class and the second
% column is the cluster number.
%function [ clusterMatrix ] = kMeansPI(dataSetMatrix)
function [ attributesRanges ] = kMeansPI(dataSetMatrix)
    % Get the range of values for each attribute.
    % Each line of attributesRanges corresponds to an attribute. The 1st and 2nd columns are, respectively  the minimum
    % and maximum value of each attribute.
    attributesRanges = zeros(size(dataSetMatrix, 2) - 1, 2);
    
    for attr = 1 : size(dataSetMatrix, 2)
        attributesRanges(attr, 1) = min(dataSetMatrix(attr, :));
        attributesRanges(attr, 2) = max(dataSetMatrix(attr, :));        
    end;
    
    
    
    % Generate c random means, where c is the number of classes.
    
    % Run the main loop until no instance change its class.
end