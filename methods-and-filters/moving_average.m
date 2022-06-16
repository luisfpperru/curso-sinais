% moving average filter

%  filters the signal x where the M is the amount of past samples 
%  influences in the moving average
%
% Use example:
%
%  t = linspace(0,20,1000).';
%  x = 0.3*sin(0.5*t) + 0.4*sin(0.1*t)+ 0.35*sin(0.05*t)+ 0.05*(2*rand(1000,1)-1);
%  y = moving_average(x,0,100);
%  plot(t,x,'b',t,y,'r')
%
function y = moving_average(x,center,M) 
        x = x(:);
        N = size(x,1);
        y = zeros(N,1);
        for i = 1:N
            k = min(M-center,i-1);
            q = min(N-i-center,0);
            y(i) = mean(x(i-k+center:i+q+center));
        end
end