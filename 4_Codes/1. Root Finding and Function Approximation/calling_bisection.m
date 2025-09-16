f = @(x) x.^2 -4;
a = 1;
b = 10;
delta = 1e-7;

root = bisection(f,a,b,delta);