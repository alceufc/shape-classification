% SCC 5830 - Processamento de Imagens
% Alceu Ferraz Costa
% Frizzi San Roman Salazar
%
% Dezembro 2010
%
function [ imgClassMap ] = generateImgClassMap(  )
    classFile = fopen(shapeClassPaths.classificationFile, 'r');
    imgClassMap = java.util.HashMap();
    
    tline = fgetl(classFile);
    while ischar(tline)
        splittedLine = regexp(tline, ',[ ]*', 'split');
        imgClassMap.put(splittedLine{1}, splittedLine{2});
        tline = fgetl(classFile);
    end
    
    fclose(classFile);
end