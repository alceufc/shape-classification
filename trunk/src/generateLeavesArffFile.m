function [   ] = generateLeavesArffFile(  )
    outputFileName = shapeClassPaths.leavesArffFile;
    fid = fopen(outputFileName, 'w');
    writeArffHeader(fid);
    

    imgClassMap = generateImgClassMap();
    
    leavesImgFiles = dir(fullfile(shapeClassPaths.leavesImgBase, '*.tif'));
    
    for i = 1 : size(leavesImgFiles)
        imgPath = fullfile(shapeClassPaths.leavesImgBase, leavesImgFiles(i).name);
        descriptors  = extractDescriptorsFromImg(imgPath);
        imgClass = imgClassMap.get(leavesImgFiles(i).name);
        
        
        for j = 1 : size(descriptors,2)
            fprintf(fid, '%f, ', descriptors(j));
        end;
        fprintf(fid, '%s\n', imgClass);
    end;
    
    fclose(fid);
end

function [] = writeArffHeader(fid)
    fprintf(fid, '@RELATION leaves\n\n');
    
    fprintf(fid, '@ATTRIBUTE fourier1  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier2  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier3  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier4  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier5  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier6  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier7  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier8  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier9  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier10  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier11  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier12  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier13  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier14  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier15  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier16  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier17  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier18  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier19  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier20  NUMERIC\n');
    fprintf(fid, '@ATTRIBUTE fourier21  NUMERIC\n\n');
    
    fprintf(fid, '@ATTRIBUTE class  {ag, bg, cg, lg, me, pe}\n\n');
    fprintf(fid, '@DATA\n');
    
end