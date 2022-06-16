
function SerieFourier(L, termos, n_pontos)

%  Funcao que aproxima uma funcao periodica por sua serie de Fourier
% 
%   Uso:
%        y = SerieFourier(L,termos,n_pontos)
%
%   Função aproxima uma função periódica dada pelos pontos discretos x e f(x).
%   A função f(x) deve ser passada através da funcao ao final do arquivo.
%
%   'L' é o intervalo de periodicidade da funcao f(x).
%
%   São usados termos da série cujos valores estão no vetor 'termos' no calculo
%   da aproximação y e plotados numa única tela.
%   Quanto mais termos da serie melhor a a aproximacao da funcao.
%
%   'n_pontos' o numero de pontos a serem usados no calculo.
%   Quantos mais pontos melhor eh a precisao do calculo nas integrais.
%
%
tic % inicia contagem de tempo
close all;
termos = termos(:); % torna variavel 'termos' um único vetor coluna
n_termos = size(termos,1); % quantidade de termos desejado
N = max(termos); % maior dos termos
x = linspace(-L,L,n_pontos)'; % cria um vetor coluna x com n_pontos no intervalo [-L L]
fx = f(x);  % guarda os valores da função f nos n_pontos
a0 = 1/L*Simpson(x,fx); % calcula o a0
a = zeros(N,1);  % inicializa os vetores de coeficientes a's
b = zeros(N,1);  % inicializa os vetores de coeficientes b's
y = a0/2*ones(size(x,1),1);  % valores da aproximação feita
j = 1; % contador de elemento de 'termos'
if (n_termos == 1)
    g2 = 1;
    g = 1;
elseif (n_termos <= 4)
    g2 = 2;
    g = 2;
else
    g2 = 3;
    g = ceil(n_termos/3); % variavel relacionada ao subplot da imagem
end
figure % cria nova janela grafica
for m = 1:N
    a(m) = 1/L*Simpson(x,fx.*cos(m*pi*x/L)); % calculo do coeficiente a(m)
    b(m) = 1/L*Simpson(x,fx.*sin(m*pi*x/L)); % calculo do coeficiente b(m)
    y = y + a(m)*cos(pi*m*x/L) + b(m)*sin(pi*m*x/L); % soma-se a contribuição dos termos a aproximacao y 
    if m == termos(j) % plota a aproximação y para cada número de termos designado 
        subplot(g,g2,j) 
        plot(x,fx,'b',x,y,'r')
        title(['Serie de Fourier com ',num2str(termos(j)),' termos'])
        legend('f(x)','Serie',4)
        j = j+1; 
    end
end
t = toc(); % finaliza contagem de tempo e armazena em 't'
disp('O tempo de execucao foi: ')
disp(t)
end
function y = f(x) % funcao em questao  
    x = x(:);
    n = size(x,1);
    y = zeros(n,1);
    for i = 1:n
        if x(i) > -1/2  && x(i) < 1/2
            y(i) = 1;
        else 
            y(i) = 0;
        end
    end
end
