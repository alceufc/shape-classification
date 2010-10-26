%Curvature detection
function outputimage = Curvature(inputimage)

[rows, columns] = size(inputimage);     % image size
outputimage = zeros(rows,columns);      % Result Image
[Mag, Ang] = Edges(inputimage);         % Edge Detection Magnitude and Angle 
Mag = MaxSupr(Mag,Ang);                 % Maximal Supression
Next = Cont(Mag, Ang);                  % Next connected pixels

%Compute curvature in each pixel
for x=1: columns-1
    for y=1: rows-1
        if Mag(y,x)~= 0 
            n = Next(y,x,1); m = Next(y,x,2);
            if (n~=-1 & m~=-1)
                [px,py] = NextPixel(x,y,n);
                [qx,qy] = NextPixel(x,y,m);
                outputimage(y,x) = abs(Ang(py,px)-Ang(qy,qx));
            end
        end
    end
end
