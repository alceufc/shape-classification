function [c1, cm1, c2, cm2] = executeParzenClassifierExperiment()
    parzenWindowSize = 0.2;
    gridSize = 10;
    dataSetMatrix = generateDataSetMatrix();
    
    % 1o Teste: Escolha de duas features:
    %     - curve_fourier8 (coluna 36)
    %     - fourier10        (coluna 17)
    selectedAttr = [36, 17];
    featureMatrix = generateFeatureMatrix(dataSetMatrix);
    selectedFeatureMatrix = selectFeatMatrixAttributes(featureMatrix, selectedAttr);
    
    numberOfVectors = size(dataSetMatrix, 1);
    %trainingSetMask = generateTrainingSetMask(numberOfVectors);
    trainingSetMask = true(1, numberOfVectors);
     
    [ targets, outputs ] = classifierParzenWindows( selectedFeatureMatrix, dataSetMatrix, trainingSetMask, parzenWindowSize, gridSize );
    [ c1, cm1 ] = confusion(targets',outputs');
    
    %2o Teste: Utilizando PCA.
    
    pcaFeatureMatrix = pcaProjection(dataSetMatrix);
    [ targets, outputs ] = classifierParzenWindows( pcaFeatureMatrix, dataSetMatrix, trainingSetMask, parzenWindowSize, gridSize );
    [ c2, cm2 ] = confusion(targets',outputs');
end

function [ trainingSetMask ] = generateTrainingSetMask(numberOfVectors)
    trainingRatio = 0.7;
    testRatio = 1 - trainingRatio;
    
    numberOfTestVectors = round(testRatio * numberOfVectors);
    testSetMask = false(1, numberOfVectors);
    
    for i = 1 : numberOfTestVectors
        idx = unidrnd(numberOfVectors);
        while testSetMask(idx) == true
            idx = unidrnd(numberOfVectors);
        end;
        testSetMask(idx) = true;
    end;
    
    trainingSetMask = ~testSetMask;
end