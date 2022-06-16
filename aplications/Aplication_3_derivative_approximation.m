% Aplicação 3: Aproximacao de derivadas
clear all; close all; clc;

L = 20; % alterando L para 1 é possivel perceber o fenômeno de Gibbs
n = 128;

x2 = linspace(-L/2,L/2,n+1); x = x2(1:n);

omega = (2*pi/L)*[0:n/2-1 -n/2:-1];

u = sech(x);
ud = -sech(x).*tanh(x);
u2d = sech(x) - 2*sech(x).^3;


ut = fft(u);
uds = real(ifft(  (1i*omega).*ut  ));
u2ds = real(ifft(  (1i*omega).^2.*ut  ));

subplot(3,1,1)
plot(x,u,'b')
title('u(x) = sech(x)')
subplot(3,1,2)
plot(x,ud,'b',x,uds,'ko')
title('derivada de u(x) = -sech(x)tanh(x)')
subplot(3,1,3)
plot(x,u2d,'b',x,u2ds,'ko')
title('derivada segunda de u(x) = sech(x) - 2tanh(x)^3')