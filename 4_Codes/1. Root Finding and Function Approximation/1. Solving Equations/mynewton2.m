function x = mynewton2 (f,f1 ,x0 ,n,tol )
% Solves f(x) = 0 by doing n steps of Newton ’s method starting at x0.
% Inputs : f -- the function , input as an inline
% f1 -- it ’s derivative , input as an inline
% x0 -- starting guess , a number
% tol -- desired tolerance , prints a warning if |f(x)|> tol
% Output : x -- the approximate solution
x = x0; % set x equal to the initial guess x0
for i = 1:n % Do n times
x = x - f(x)/ f1(x); % Newton ’s formula
end
r = abs (f(x));
if r > tol
warning ('The desired accuracy was not attained')
end

% Example: mynewton2(@(x)x^2+2*x-4,@(x)2*x+2,1,100,1e-52)