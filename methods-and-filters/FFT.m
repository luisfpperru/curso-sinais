% Transformada Rápida de Fourier
%
%   Uso :
%           X = FFT(x)
%
%   Calcula os componentes do vetor X(k) a partir dos pontos do vetor x(n)
%   por meio de: 
%
%                    N
%      X(k) =       sum  x(n)*exp(-i*2*pi*(k-1)*(n-1)/N), 1 <= k <= N.
%                   n=1
%
function X = FFT(x)               % DFT de (x0, x1, x2, ..., xN-1)
    x = x(:);
    N = size(x,1);
    X = zeros(N,1);
    W = exp(-2*pi*1i/N);
    if N == 1 
        X = x;                  %  caso trivial DFT de dimens�o 2
    else
        Xe = FFT(x(1:2:end));           %   DFT de (x0, x2, x4, ..., xN-2)
        Xo = FFT(x(2:2:end));           %  DFT of (x1, x3, x5, ..., xN)
        for k = 0:N/2-1                          % combina as DFTs das duas metades em uma �nica DFT:
            X(k+1) = Xe(k+1) + W^k*Xo(k+1);
            X(k+1+N/2) = Xe(k+1) - W^k*Xo(k+1);
        end
    end
end
