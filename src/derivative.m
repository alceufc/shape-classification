function dy = derivative(sigma,z,x)

% Fourier transform of z
y = fftshift(z);
Y = fft(y);

M = size(x);
N = M(1,2);
ts = ( x(1,N) - x(1,1) )/N;
df = 1.0/(ts*N);
N2 = floor(N/2);
N1 = N - 1;
s = -N2:(N1-N2); % center to origen
X = s*df;

% Filter function Gaussian
GAU = exp(-((X.^2)/(sigma^2))/2); % mascara
GAU = fftshift(GAU);

% Inverse transform the filtered transformed
A = ( GAU'.*Y );

% Derivative Function
DER = 2*pi*j*X;
DER = fftshift(DER);

% Derivative Calculation
DY = A.*DER';
dy = ifft(DY);
dy = fftunshift(real(dy));

