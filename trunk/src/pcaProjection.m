% Projects the feature vectors of dataSetMatrix into 2 dimensions using
% PCA.
function [ pcaFeatureMatrix ] = pcaProjection( dataSetMatrix )
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    [coeff, pcaFeatureMatrix] = princomp(zscore(featureMatrix));
    %pcaFeatureMatrix = princomp(zscore(featureMatrix));
    
    % Get only the 2 components with the greatest variance.
    pcaFeatureMatrix = pcaFeatureMatrix(:, 1:2);
end