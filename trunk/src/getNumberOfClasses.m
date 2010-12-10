function [ numberOfClasses ] = getNumberOfClasses(dataSetMatrix)
    classes = dataSetMatrix(:, size(dataSetMatrix,2));
    numberOfClasses = numel(unique(classes));
end