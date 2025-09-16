% Now suppose we have a vector of functions (f1(x), f2(x),...,fn(x)) with x
% belongs to R^n.

% The Taylor expansion then becomes the following one f(x) = f(x0) +
% Jx0*(x-x0), where Jx is the Jacobian

% For example consider the folloeing case:

% Find the zeros of the following system of equations

% x^2 - 4 + y = 0;
% y + 5 = 0;

% x0 is the column vector of the initial values 
x0= [1;1];

% Maximum number of iterations
maxit = 1000;

% Parameters of the system
param = [2;4;5];

% Criterium
crit = 0.001;





