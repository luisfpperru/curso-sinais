%  Serie Discreta de Fourier
% 
%   Uso:
%        y = DFS(x,fx,T)
%
%   Esta função aproxima uma função periódica dada pelos pontos discretos x e fx. 
%   São usados T termos da série no calculo da aproximação y. 
%   Por definição, o intervalo de periodicidade é tomado de forma que 
%   min(x) = -L e max(x) = L.
%
function [y,a0,a,b] = DFS(x,fx,T)
    [x,ordem] = sort(x(:));
    fx = fx(:);
    fx = fx(ordem);
    L =  (max(x) - min(x))/2; % intervalo de periodicidade da função
    [a0,a,b] = DFScalc(x,fx,L,T);
    figure
    hold on
    p = stem(pi/L*(0:T),abs([a0;a]),'b');
    set(p,'LineWidth',2,'MarkerSize',4); grid on
    p = stem(pi/L*(1:T),abs(b),'r');
    set(p,'LineWidth',2,'MarkerSize',4); grid on
    hold off
%     plot(pi/L*(0:T),abs([a0;a]),'bo',pi/L*(1:T),abs(b),'ro')
    legend('an','bn')
    a(abs(a)/max(abs([a0;a;b])) < 0.2) = 0;
    b(abs(b)/max(abs([a0;a;b])) < 0.2) = 0;
    a0(abs(a0)/max(abs([a0;a;b])) < 0.2) = 0;
    y = DFSeval(x,L,a0,a,b);
end
function [a0,a,b] = DFScalc(x,fx,L,T)
    a0 = 1/L*Simpson(x,fx); % calcula o a0
    a = zeros(T,1);  % inicializa os vetores de coeficientes a(k)'s
    b = zeros(T,1);  % inicializa os vetores de coeficientes b(k)'s
    for m = 1:T
        a(m) = 1/L*Simpson(x,fx.*cos(m*pi*x/L)); % calculo do coeficiente a(m)
        b(m) = 1/L*Simpson(x,fx.*sin(m*pi*x/L)); % calculo do coeficiente b(m)
    end
end
function y = DFSeval(x,L,a0,a,b)
    N = size(x,1);
    T = size(a,1); 
    m = (1:T);
    y = a0/2*ones(N,1) + cos(pi*x*m/L)*a + sin(pi*x*m/L)*b; % calcula os valores da série
end