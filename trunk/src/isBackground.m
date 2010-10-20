function [ isBckg ] = isBackground(pixelValue)
    isBckg = (pixelValue == 255);
end