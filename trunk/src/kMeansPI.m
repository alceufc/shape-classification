% Each line of clusterMatrix corresponds to an instance (image). The first column is the instance class and the second
% column is the cluster number. The cluster number is a number between 1 and the number of classes in the image base.
function [ clusterMatrix ] = kMeansPI(dataSetMatrix)
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    featureMatrix = zscore(featureMatrix);
    
    % Get the range of values for each attribute.
    % Each line of attributesRanges corresponds to an attribute. The 1st and 2nd columns are, respectively  the minimum
    % and maximum value of each attribute.
    attributesRanges = zeros(size(featureMatrix, 2), 2);
    
    for attr = 1 : size(featureMatrix, 2)
        attributesRanges(attr, 1) = min(featureMatrix(:, attr));
        attributesRanges(attr, 2) = max(featureMatrix(:, attr));
    end;
    
    numberOfClasses = getNumberOfClasses(dataSetMatrix);
    numberOfFeatures = size(featureMatrix, 2);
    
    % Generate c random means, where c is the number of classes.
    % meansCoordinates(i, 1) and meansCoordinates(i, 2) corresponds to the coordinates (feature vector) of the i-th 
    % mean point.
    meansCoordinates = zeros(numberOfClasses, numberOfFeatures);
    for meanPoint = 1 : size(meansCoordinates,1)
        for attr = 1 : size(meansCoordinates, 2)
            meansCoordinates(meanPoint, attr) = random('unif', attributesRanges(attr, 1), attributesRanges(attr, 2));
        end;
    end;
    
    % Run the main loop until no instance change its class.
    iterationCounter = 0;
    clusterSwapFlag = true;
    
    clusterMatrix = cell(size(dataSetMatrix,1), 2);
    clusterMatrix(:, 1) = dataSetMatrix(:, size(dataSetMatrix,2));
    for row = 1 : size(clusterMatrix, 1)
        clusterMatrix{row, 2} = 1;
    end;
    
    while clusterSwapFlag == true
        clusterSwapFlag = false;
        iterationCounter = iterationCounter + 1;
        
        for row = 1 : size(featureMatrix, 1)
            newCluster = updateCluster(row, featureMatrix, meansCoordinates);
            if newCluster ~= clusterMatrix{row, 2}
                clusterSwapFlag = true;
                clusterMatrix{row, 2} = newCluster;
            end;
        end;
        
        meansCoordinates = updateMeansCoordinates(clusterMatrix, featureMatrix, meansCoordinates);
    end;
end

function [ numberOfClasses ] = getNumberOfClasses(dataSetMatrix)
    classes = dataSetMatrix(:, size(dataSetMatrix,2));
    numberOfClasses = numel(unique(classes));
end

function [newCluster] = updateCluster(row, featureMatrix, meansCoordinates)
    curDist = euclidianDist(featureMatrix(row,:), meansCoordinates(1, :));
    newCluster = 1;
    
    for cluster = 2 : size(meansCoordinates, 1);
        d =  euclidianDist(featureMatrix(row,:), meansCoordinates(cluster, :));
        if d < curDist
            curDist = d;
            newCluster = cluster;
        end;
    end;
end

% Squared euclidian distance.
function [ d ]  = euclidianDist(v1, v2)
    d = 0;
    for i = 1 : size(v1, 2)
        d = d + (v1(i) * v2(i))^2;
    end;
end

function [ meansCoordinates ] = updateMeansCoordinates(clusterMatrix, featureMatrix, oldMeansCoordinates)
    numberOfClusters = size(oldMeansCoordinates, 1);
    numberOfFeatures = size(featureMatrix, 2);
    meansCoordinates = zeros(numberOfClusters, numberOfFeatures);
    
    for cluster = 1 : numberOfClusters
        numberOfElements = 0;
        
        for row = 1 : size(featureMatrix, 1)
            if clusterMatrix{row, 2} == cluster
                numberOfElements = numberOfElements + 1;
                meansCoordinates(cluster, :) = meansCoordinates(cluster, :) + featureMatrix(row, :);
            end;
        end;
        
        if numberOfElements > 0
            meansCoordinates(cluster, :) = meansCoordinates(cluster, :) ./ numberOfElements;
        else
            meansCoordinates(cluster, :) = oldMeansCoordinates(cluster, :);
        end;
    end;
end

