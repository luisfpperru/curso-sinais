% Algoritmo para calcular o valor numérico de uma integral
%
%  Uso:
%       I = Simpson(x,fx) 
% 
%   Em que x é vetor de pontos e fx suas imagens.
%   O calculo do valor da integral é feito num intervalo [a,b] tal que 
%   a = min(x) e b = max(x) por meio de um da Regra de 3/8 de Simpson
%   Generalizada.
%  

function I = Simpson(x,fx) 
    x = x(:);
    fx = fx(:);
    n = size(x,1); % n�mero de pontos do dom�nio
    h = (x(n)- x(1))/(n+1); % tamanho de cada subintervalo 

    % Calculo do valor I da integral
    
    I = fx(1) + fx(n); 
    for i = 2:n-1
        if mod(i,3) == 0
            I  = I + 2*fx(i);
        else 
            I  = I + 3*fx(i);
        end
    end
    I = 3/8*h*I;
end
