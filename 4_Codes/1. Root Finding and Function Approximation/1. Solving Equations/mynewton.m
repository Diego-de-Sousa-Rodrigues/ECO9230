function x = mynewton (f,f1 ,x0 ,n)
% Solves f(x) = 0 by doing n steps of Newton ’s method starting at x0.
% Inputs : f -- the function , input as an inline
% f1 -- it ’s derivative , input as an inline
% x0 -- starting guess , a number
% n -- the number of steps to do
% Output : x -- the approximate solution
format long % prints more digits
format compact % makes the output more compact
x = x0; % set x equal to the initial guess x0
for i = 1:n % Do n times
x = x - f(x)/ f1(x); % Newton ’s formula , prints x too
end

% Example 1: mynewton(@(x)x^2+2*x-4,@(x)2*x+2,1,100)
% Example 2:mynewton(@(x)x^2-4,@(x)2*x,1,100)