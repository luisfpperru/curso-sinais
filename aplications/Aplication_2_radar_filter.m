% Aplicacao 2: Filtro de radar
clear all; close all; clc;

T = 40;
n = 1024;

t2 = linspace(-T/2,T/2,n+1); t = t2(1:n);
k = (2*pi/T)*[0:n/2-1 -n/2:-1];
ks = fftshift(k);
u = sech(t);
ut = fft(u);
uts = abs(fftshift(ut));

noise = 20;
utn = ut + noise*(randn(1,n) + 1i*randn(1,n) );
un = ifft(utn);
utns = abs(fftshift(utn));

filter = exp(-k.^2);
filters = fftshift(filter);
utnf = filter.*utn;
utnfs = abs(fftshift(utnf));
unf = abs(ifft(utnf));

figure
subplot(2,2,1), plot(t,u,'k--')
title('sinal original')
subplot(2,2,2),plot(t,real(un),'b');
title('sinal ruidoso')
subplot(2,2,3),plot(ks,uts/max(uts),'k--')
title('transformada do sinal original')
subplot(2,2,4),plot(ks,utns/max(utns),'b')
title('transformada do sinal ruidoso')
axis([-25 25 0 1])

figure
subplot(4,1,1), plot(t,real(un/max(un)),'b') 
subplot(4,1,2), plot(ks,utns/max(utns),'b',ks,filters,'k:')
axis([-25 25 0 1])
subplot(4,1,3), plot(ks,utnfs/max(utnfs),'g--')
axis([-25 25 0 1])
subplot(4,1,4), plot(t,unf,'g--',t,0*t + 0.5,'k--')
axis([-15 15 0 1])


filter = exp(-(k+15).^2);
filters = fftshift(filter);
utnf = filter.*utn;
utnfs = abs(fftshift(utnf));
unf = abs(ifft(utnf));

figure
subplot(4,1,1), plot(t,real(un/max(un)),'b') 
subplot(4,1,2), plot(ks,utns/max(utns),'b',ks,filters,'k--')
axis([-25 25 0 1])
subplot(4,1,3), plot(ks,utnfs/max(utnfs),'g--' )
axis([-25 25 0 1])
subplot(4,1,4), plot(t,unf,'g--',t,0*t + 0.5,'k--')
axis([-15 15 0 1])