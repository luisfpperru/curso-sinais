% Transformada Rapida Inversa de Fourier
%
%   Uso :
%           x = iFFT(X)
%
%   Calcula os componentes do vetor x(n) a partir dos pontos do vetor X(k)
%   por meio de: 
%
%                    N
%      x(n) =       sum  X(k)*exp(i*2*pi/N*k*n), 0 <= n <= N-1.
%                   n=1
%
function x = iFFT(X)               % DFT inversa de (x0, x1, x2, ..., xN-1)
    X = X(:);
    N = size(X,1);
    x = zeros(N,1);
    W = exp(2*pi*1i/N);
    if N == 1 
        x = X;                  %  caso trivial DFT de dimensao 2
    else
        xe = iFFT(X(1:2:end));           %   DFT de (x0, x2, x4, ..., xN-2)
        xo = iFFT(X(2:2:end));           %  DFT of (x1, x3, x5, ..., xN)
        for n = 0:N/2-1                          % combina as DFTs das duas metades em uma �nica DFT:
            x(n+1) = xe(n+1) + W^n*xo(n+1);
            x(n+1+N/2) = xe(n+1) - W^n*xo(n+1);
        end
    end
end
