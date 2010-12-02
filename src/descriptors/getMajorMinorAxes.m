
function [ X1, Y1, X2, Y2 ] = getMajorMinorAxes( img, scaleFactor )
    addpath('../');
    if isrgb(img)== 1
        img = im2bw(img);
    end;
    
    [X, Y] = extractBorder(img);
    [xc, yc] = getCenterOfMass(X, Y);
    
    objRows = zeros(numel(img), 1);
    objCols = zeros(numel(img), 1);
    
    tmp = 1;
    for row = 1 : size(img, 1)
        for col = 1 : size(img, 2)
            if isObject(img(row,col))
                objRows(tmp) = row;
                objCols(tmp) = col;
            end;
            tmp = tmp + 1;
        end;
    end;
    
    objRows = objRows(1:tmp - 1);
    objCols = objCols(1:tmp - 1);
    
    S = [objRows objCols];
    covMatrix = cov(S);
    [EigVectors, EigValues] = eig(covMatrix);
    
    eigVectorsNorm = norm(EigVectors(:,1));
    biggerEigValue =  max([EigValues(1,1) EigValues(2,2)]);
    minorImgDim = min(size(img));
    
    eigenAxisFactor = scaleFactor * minorImgDim / biggerEigValue / eigVectorsNorm;
    
    X1 = [xc, xc + EigVectors(1,1) * EigValues(1,1) * eigenAxisFactor];
    Y1 = [yc, yc + EigVectors(2,1) * EigValues(1,1) * eigenAxisFactor];
    
    X2 = [xc, xc + EigVectors(1,2) * EigValues(2,2) * eigenAxisFactor];
    Y2 = [yc, yc + EigVectors(2,2) * EigValues(2,2) * eigenAxisFactor];
end
