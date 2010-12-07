function [ featureMatrix ] = generateFeatureMatrix(  )
    featureMatrix = generateDataSetMatrix();
    featureMatrix = featureMatrix(1 : size(featureMatrix,2) - 1);
end