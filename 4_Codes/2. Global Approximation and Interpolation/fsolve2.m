% fsolve
% f(x) = 0
%
% where x is a vector of unknowns and f is a function
% vector. Our system of equations is
%
% 2*x(1) - x(2) - exp(-x(1)) = 0
% -x(1) + 2*x(2) - exp(-x(2)) = 0.
%

% Left-hand side of our system of equations:
myfun = @(x) [2*x(1) - x(2) - exp(-x(1)); ...
-x(1) + 2*x(2) - exp(-x(2))];
% Make a starting guess at the solution
x0 = [-5; -5];
% Set option to display information after each iteration
options=optimset('Display','iter');
% Solve the system
[x,fval,exitflag] = fsolve(myfun,x0,options)