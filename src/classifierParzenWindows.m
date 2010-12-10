% This code assumes that featureMatrix has only 2 columns.
function [ targets, outputs ] = classifierParzenWindows( featureMatrix, dataSetMatrix, trainingSetMask, parzenWindowSize, dimensionSize )
    featureMatrix = zscore(featureMatrix);
    classesMatrix = extractClassesMatrix(dataSetMatrix);
    
    trainingFeatureMatrix = featureMatrix(trainingSetMask, :);
    trainingClasses = dataSetMatrix(trainingSetMask, size(dataSetMatrix,2));
    parzenHistograms = generateParzenHistogram(trainingFeatureMatrix, trainingClasses, classesMatrix, parzenWindowSize, dimensionSize);
    
    %testSetMask = ~trainingSetMask;
    testSetMask = trainingSetMask;
    testFeatureMatrix = featureMatrix(testSetMask, :);
    testClasses = dataSetMatrix(testSetMask, size(dataSetMatrix,2));
    outputs = estimateProbabilities(parzenHistograms, testFeatureMatrix, parzenWindowSize, dimensionSize);
    
    targets = zeros(size(testFeatureMatrix, 1), getNumberOfClasses(dataSetMatrix));
    
    for row = 1 : size(targets, 1)
        targets(row, find(strcmp(classesMatrix, testClasses(row)))) = 1;
    end;
end

% parzenHistograms is a C x Dim1 x Dim2 matrix where:
%    C: corresponds to the number of classes in classesMatrix
%    Dim1 and Dim2: 
function [ parzenHistograms ] = generateParzenHistogram(featMatrix, trainingClasses, classesMatrix, parzenWindowSize, dimensionSize)
    numberOfClasses = size(classesMatrix, 1);
    numberOfBins = ceil(dimensionSize / parzenWindowSize);
    parzenHistograms = zeros(numberOfClasses, numberOfBins, numberOfBins);
    
    for class = 1 : numberOfClasses
        % Get the feature vectors for this class from
        % trainingFeatureMatrix.
        featVecIdxs = find(strcmp(trainingClasses(:, 1), classesMatrix(class)));
        featVecs = featMatrix(featVecIdxs, :);
        
        parzenHistograms(class, :, :) = generateHistogram(featVecs, parzenWindowSize, numberOfBins);
    end;
    
end

function [ histogram ] = generateHistogram(featVecs, parzenWindowSize, numberOfBins)
    maxBinIdx = floor(numberOfBins/2);
    if mod(numberOfBins, 2) == 0
        minBinIdx = - (maxBinIdx - 1);
    else
        minBinIdx = - maxBinIdx;
    end;
    
    histogram = zeros(numberOfBins, numberOfBins);
    [Dim1, Dim2] = meshgrid(minBinIdx : maxBinIdx, minBinIdx : maxBinIdx);
    Dim1 = Dim1 .* parzenWindowSize;
    Dim2 = Dim2 .* parzenWindowSize;
    
    for vector = 1 : size(featVecs, 1)
        sigma = parzenWindowSize*4;
        k1 = 2 * sigma^2;
        k2 = 1 / (pi * k1);
        histogram = histogram +  k2 * exp( - ((featVecs(vector,1) - Dim1).^2 + (featVecs(vector,2) - Dim2).^2) / k1 );
    end;
    histogram = histogram ./ size(featVecs, 1);
end

function [ outputs ] = estimateProbabilities(parzenHistograms, testFeatureMatrix, parzenWindowSize, dimensionSize)
    numberOfVectors = size(testFeatureMatrix, 1);
    numberOfClasses = size(parzenHistograms, 1);
    outputs = zeros(numberOfVectors, numberOfClasses);
    
    % Calculate the indexes of the center of the histogram matrix.
    numberOfBins = ceil(dimensionSize / parzenWindowSize);
    centerIdx = ceil(numberOfBins/2);
    
    for vector = 1 : numberOfVectors
        for class = 1 : numberOfClasses
            coord1 = round(testFeatureMatrix(vector, 1)/parzenWindowSize) + centerIdx;
            coord2 = round(testFeatureMatrix(vector, 2)/parzenWindowSize) + centerIdx;
            outputs(vector, class) = parzenHistograms(class, coord1, coord2);
        end;
    end;
    
end