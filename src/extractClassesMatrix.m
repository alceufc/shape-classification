function [ classesMatrix ] = extractClassesMatrix(dataSetMatrix)
    classes = dataSetMatrix(:, size(dataSetMatrix,2));
    classesMatrix = unique(classes);
end