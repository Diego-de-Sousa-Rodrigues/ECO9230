% fsolve_demo.m  Two-equation system demo
% 2*x1 - x2 - exp(-x1) = 0
% -x1 + 2*x2 - exp(-x2) = 0
clear; clc;
myfun   = @(x)[2*x(1)-x(2)-exp(-x(1)); -x(1)+2*x(2)-exp(-x(2))];
x0      = [-5; -5];                      % start
options = optimset('Display','iter');    % show iterations
[x,fval,exitflag] = fsolve(myfun,x0,options)
