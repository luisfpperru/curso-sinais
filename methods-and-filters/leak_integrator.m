% leak integrator filter

%  filters the signal x where the lambda is the amount the past samples 
%  influences in the mean 
%
% Use example:
%
%  t = linspace(0,20,1000).';
%  x = 0.3*sin(0.5*t) + 0.4*sin(0.1*t)+ 0.35*sin(0.05*t)+ 0.05*(2*rand(1000,1)-1);
%  y = leak_integrator(x,0.98);
%  plot(t,x,'b',t,y,'r')
%

function y = leak_integrator(x,lambda) 
        x = x(:);
        N = size(x,1);
        y = zeros(N,1);
        y(1) = x(1);
        for i = 2:N
            y(i) = lambda*y(i-1) + (1 - lambda)*x(i);
        end
end