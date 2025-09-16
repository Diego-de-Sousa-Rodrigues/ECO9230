function [f,J] = nexp2(z,p)
x = z(1);
y = z(2);
a = p(1);
b = p(2);
c = p(3);
f=[x^a-b+y; y + c];
J= [a*x^(a-1) 1; 0 1];
end

% x0 is the column vector of the initial values 
% x0 = [1;1]

% Maximum number of iterations
% maxit = 1000;

% Parameters of the system
% param = [2;4;5];

% sol=newton('nexp2', x0, param, 1e-3, maxit)
