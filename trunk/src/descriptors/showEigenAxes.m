function [  ] = showEigenAxes( img , scaleFactor)
    [V1x, V1y, V2x, V2y] = getMajorMinorAxes( img, scaleFactor );
    imshow(img);
    hold on
    line(V2x, V2y);
    hold on
    line(V1x, V1y);
end

