function r = fftunshift(x);
[m n] = size(x);
if (m ~= 1)
 transpose_flag = 1;
 x = x.';
else
 transpose_flag = 0;
end

Np = length(x);
Np1 = Np-1;
Np2 = floor( Np / 2);

r = [ x((Np2+1):Np) x(1:Np2) ];

if( transpose_flag )
 r = r.';
end