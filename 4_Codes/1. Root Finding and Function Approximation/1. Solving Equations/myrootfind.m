function [a,b] = myrootfind (f,a0 ,b0)
% function [a,b] = myrootfind (f,a0 ,b0)
% Looks for subintervals where the function changes sign
% Inputs : f -- an inline function
% a0 -- the left edge of the domain
% b0 -- the right edge of the domain
% Outputs : a -- an array , giving the left edges of subintervals
% on which f changes sign
% b -- an array , giving the right edges of the subintervals
n = 1001; % number of test points to use
a = []; % start empty array
b = [];
% split the interval into n -1 intervals and evaluate at the break points
x = linspace (a0 ,b0 ,n);
y = f(x);
% loop through the intervals
for i = 1:(n -1)
if y(i)*y(i +1) < 0 % The sign changed , record it
a = [a x(i)];
b = [b x(i +1)];
end
end
if size (a ,1) == 0
warning ('no roots were found')
end