% Transformada Discreta de Fourier
%
%   Uso :
%           X = DFT(x)
%
%   Calcula os componentes do vetor X(k) a partir dos pontos do vetor x(n)
%   por meio de: 
%
%                    N
%      X(k) =       sum  x(n)*exp(-i*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                   n=1
%
function X = DFT(x)
    x = x(:);
    N = size(x,1);
    k = 0:N-1;
    n = 0:N-1;
    Omega = exp(-1i*2*pi*k'*n/N);
    X = Omega*x;
end
