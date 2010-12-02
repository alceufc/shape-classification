function [ isBckg ] = isBackground(pixelValue)
    isBckg = (pixelValue == 255 || pixelValue == 1);
end