% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
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
        
        % Save the feature vector numeric attributes.
        for i = 1: length(splittedLine) - 1;
            dataSetMatrix{dataSetMatrixLine, i} = str2double(splittedLine{i});
        end
        
        dataSetMatrix{dataSetMatrixLine, length(splittedLine)} = splittedLine{length(splittedLine)};
        
        % Save the class attribute.
        
        dataSetMatrixLine = dataSetMatrixLine + 1;
        tline = fgetl(classFile);
    end
    
    fclose(classFile);
end