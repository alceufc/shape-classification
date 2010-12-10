function [ newFeatMatrix ] = selectFeatMatrixAttributes(featureMatrix, attrIndexes)
   newFeatMatrix =  featureMatrix(:, attrIndexes);
end