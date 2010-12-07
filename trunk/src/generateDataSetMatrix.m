function [ dataSetMatrix ] = generateDataSetMatrix(  )
    %Warning: bad code!
    numberOfImages = 62;
    
    classFile = fopen(shapeClassPaths.leavesArffFile, 'r');
        
    % Skip the arff header.
    tline = fgetl(classFile);
    splittedLine = regexp(tline, '[ ]*', 'split');
    
    while equal(splittedLine{1},'@DATA')
        tline = fgetl(classFile);
        splittedLine = regexp(tline, ',[ ]*', 'split');        
    end
    
    
    tline = fgetl(classFile);
    dataSetMatrixLine = 1;
    while ischar(tline)
        splittedLine = regexp(tline, ',[ ]*', 'split');
        
        if dataSetMatrixLine == 1
            % We have to initialize the data set matrix.
            dataSetMatrix = cell(numberOfImages, length(splittedLine));
        end;
        
        for i = 1: length(splittedLine);
            dataSetMatrix{dataSetMatrixLine, i} = splittedLine{i};
        end
        
        dataSetMatrixLine = dataSetMatrixLine + 1;
        tline = fgetl(classFile);
    end
    
    fclose(classFile);
end