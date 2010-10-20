function [ area ] = getArea( img )
    addpath('../');
    if isrgb(img)== 1
        img = im2bw(img);
    end;
    
    area = 0;
    for row = 1 : size(img, 1)
        for col = 1 : size(img, 2)
            if isObject(img(row,col))
                area = area + 1;
            end;
        end;
    end;
end

