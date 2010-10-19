% img: Binary image where white (value 1) pixels represents the background and black pixels (value 0) represents the
% object.
function [ X, Y ] = extractBorder( img )
    if isrgb(img)== 1
        img = im2bw(img);
    end;
    
    % TODO: error message if the top left corner is black.
    
    [firstPixRow, firstPixCol] = findStartPixelPos(img);
    [secondPixRow, secondPixCol, fsDir] = findSecondPixelPos(img, firstPixRow, firstPixCol);
    [rowVector, colVector] = contourFollowing(img, secondPixRow, secondPixCol, fsDir);
    
    Y = rowVector;
    X = colVector;
end

function [rowVector, colVector] = contourFollowing(img, secondPixRow, secondPixCol, fsDir)
    % To avoid array resizing, pre-allocate memory for rowVector and colVector.
    rowVector = zeros(numel(img), 1);
    colVector = zeros(numel(img), 1);
    
    % Add the first pixel to border.
    [rowVector(1), colVector(1)] = chainPoint(secondPixRow, secondPixCol, invertDir(fsDir));
    
    %pcDir stores the direction from the previous pixel to the currently visited pixel.
    pcDir = fsDir;
    
    %curPix stores the currently visited pixel.
    curPixRow = secondPixRow;
    curPixCol = secondPixCol;
    
    % borderElems stores the number of elements in the border.
    borderElems = 1;
    
    while ~(curPixRow == rowVector(1) && curPixCol == colVector(1))
        % Add the current pixel to the border arrays.
        borderElems = borderElems + 1;
        rowVector(borderElems) = curPixRow;
        colVector(borderElems) = curPixCol;
        
        [curPixRow, curPixCol, pcDir] = findNextPixel(curPixRow, curPixCol, pcDir, img);
    end;
    
    % Slice border arrays to the correct size.
    rowVector = rowVector(1:borderElems);
    colVector = colVector(1:borderElems);
end

function [newPixRow, newPixCol, newPcDir] = findNextPixel(curPixRow, curPixCol, pcDir, img)
    cpDir = invertDir(pcDir);
    
    % Initialize newPixRow and newPixCol with invalid values.
    newPixRow = -1;
    newPixCol = -1;
    newPcDir = -1;
    
    for dirIncrement = 0 : 6
        dirA = mod(cpDir + dirIncrement, 8);
        dirB = mod(cpDir + dirIncrement + 1, 8);
        
        [aRow, aCol] = chainPoint(curPixRow, curPixCol, dirA);
        [bRow, bCol] = chainPoint(curPixRow, curPixCol, dirB);
        
        if img(aRow, aCol) == 1 && img(bRow, bCol) == 0
            newPixRow = aRow;
            newPixCol = aCol;
            newPcDir = dirA;
        end;
    end;
end

% This function assumes that the top left corner pixel of the image is white.
function [ startRow, startCol ] = findStartPixelPos(img)
    % Initialize startRow and startCol with invalid values.
    startRow = -1;
    startCol = -1;
    
    for row = 1 : size(img, 1)
        for col = 1 : size(img, 2) - 1
            if img(row, col + 1) == 0
                startRow = row;
                startCol = col + 1;
                return;
            end;
        end;
    end;
end

%fsDir is the direction from the first pixel to the second pixel.
function [secondPixRow, secondPixCol, fsDir] = findSecondPixelPos(img, firstPixRow, firstPixCol)
    for direction = 5 : 7
        [row, col] = chainPoint(firstPixRow, firstPixCol, direction);
        
        if img(row, col) == 0
            [secondPixRow, secondPixCol] = chainPoint(firstPixRow, firstPixCol, direction - 1);
            fsDir = direction;
            return;
        end;
    end;
    [secondPixRow, secondPixCol] = chainPoint(firstPixRow, firstPixCol, 7);
end

% Returns in [neighRow, neighCol] the pixel that is neighbor to pixel with coordinates row, col in the direction given
% by the input parameter 'direction'.
%
% Chain code matrix:
%
%        .---.---.---.
%        | 3 | 2 | 1 |
%        |---|---|---|
%        | 4 | P | 0 |
%        |---|---|---|
%        | 5 | 6 | 7 |
%        '---'---'---'
%
function [neighRow, neighCol] = chainPoint(row, col, direction)
    % Get coordinates increment.
    switch direction
        case 0
            inc = [0 1];
            
        case 1
            inc = [-1 1];
            
        case 2
            inc = [-1 0];
            
        case 3
            inc = [-1 -1];
            
        case 4
            inc = [0 -1];
        
        case 5
            inc = [1 -1];
            
        case 6
            inc = [1 0];
            
        case 7
            inc = [1 1];
    end;
    
    neighRow = inc(1) + row;
    neighCol = inc(2) + col;
end

function [ invertedDir ] = invertDir(dir)
    invertedDir = mod(dir + 4, 8);
end
