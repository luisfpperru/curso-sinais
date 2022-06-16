% Aplicacao 1: Medicoes Fluviometricas

clear all; clc; close all;
T = 400;
n_amostras = 600;
t = linspace(0,T,n_amostras).';
ft = 0.75*cos(2*pi/50*t)+0.25*cos(2*pi/100*t)+ 0.5*randn(n_amostras,1);
plot(t,ft,'b')
grid on
title('medicao fluviometrica')
xlabel('t(dias)')
ylabel('f(t) (nivel do rio)')

termos = 20; % número de termos da série 
[y,a0,a,b] = DFS(t,ft,termos);

X = DFT(ft);
omega = 2*pi/T*(-n_amostras/2:n_amostras/2-1);
figure
subplot(2,1,1)
plot(omega,abs(real(fftshift(X))) )
grid on
title('espectrograma (nivel do rio) ')
xlabel('omega(dominio da frequencia) ')
ylabel('F(omega) - parte real ')
ax = axis;
subplot(2,1,2)
plot(omega,abs(imag(fftshift(X))) )
grid on
axis(ax);
xlabel('omega(dominio da frequencia) ')
ylabel('F(omega) - parte imaginaria  ')
figure
plot(omega,abs(real(fftshift(X))) )
grid on
title('espectrograma (nivel do rio) ')
xlabel('omega(dominio da frequencia) ')
ylabel('F(omega) - parte real ')
axis([-1,1,0,300]);
X(abs(X)/max(abs(X)) < 0.2) = 0;
y2 = real(iDFT(X));
figure
subplot(3,1,1)
plot(t,ft,'b')
grid on
title('medicao fluviom�trica')
xlabel('t(dias)')
ylabel('f(t) (nivel do rio)')
ax = axis;
subplot(3,1,2)
plot(t,y,'r')
grid on
axis(ax);
title('medicao fluviometrica - aproximacao por serie')
xlabel('t(dias)')
ylabel('f(t) (nivel do rio)')
subplot(3,1,3)
plot(t,y2,'r')
grid on
axis(ax);
title('medicao fluviometrica - aproximacao pela transformada')
xlabel('t(dias)')
ylabel('f(t) (nivel do rio)')
