function [f, J] = nexp1(z,p)
x = z(1);
a=p(1);
f=(x-a)*(x-a);
J= 2*x;
end

% newton('nexp1',1,4,1e-3,1000) - We can use this code to find the zeros of
% the function  = (x-4)*(x-4)

% sol=newton('nexp2', x0, param, crit, maxit);
% sprintf('x=%g', sol(1))
% sprintf('y=%g', sol(2))
