% Transformada Inversa Discreta de Fourier
%
%   Uso :
%           X = iDFT(x)
%
%   Calcula os componentes do vetor x(n) a partir dos pontos do vetor X(k)
%   por meio de: 
%
%                      N
%      x(n) = (1/N)   sum  X(k)*exp(i*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                     k=1
%
function x = iDFT(X)
    X = X(:);
    N = size(X,1);
    k = 0:N-1;
    n = 0:N-1;
    Omega = exp(1i*2*pi*n'*k/N);
    x = 1/N*Omega*X;
end