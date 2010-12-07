function [ fvMatrix ] = generateFeatureMatrix(  )
    classFile = fopen(shapeClassPaths.leavesArffFile, 'r');
    
    featureVector = java.util.ArrayList();
    fvMatrix = java.util.ArrayList();
    
    tline = fgetl(classFile);
    splittedLine = regexp(tline, '[ ]*', 'split');
    
    while equal(splittedLine{1},'@DATA')
        tline = fgetl(classFile);
        splittedLine = regexp(tline, ',[ ]*', 'split');        
    end
    
    tline = fgetl(classFile);
    
    while ischar(tline)
        splittedLine = regexp(tline, ',[ ]*', 'split');
        for i=1: length(splittedLine);
            featureVector.add(splittedLine{i});
        end
        fvMatrix.add(featureVector);
        tline = fgetl(classFile);
    end
    
    fclose(classFile);
end