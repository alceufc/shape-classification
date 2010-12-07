function [ outImg ] = preprocessInputImage( img )
    if isrgb(img)== 1
        img = im2bw(img);
    end;
    
    se = strel('disk',3);
    outImg = imclose(img, se);
end

