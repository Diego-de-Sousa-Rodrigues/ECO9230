% Taylor’s Theorem: any sufficiently smooth function can be
% locally approximated by polynomials
%  Advantage: Gives us the exact approximation
%  Disadvantage: Holds locally; e.g. as we move away from the
%  steady state, approximation may deteriorate a lot

% We can use Taylor's Theorem for univariate or multivariate functions

% A Local approximation give us good approximations near a point x*,
% however the approximation deteriorates a lot as we go far away of x*


syms x
f = 1/(5 + 4*cos(x));
T = taylor(f, 'Order', 8)
% Generates a Taylor Expansion but not including the 8th order

syms x
g = exp(x*sin(x));
t = taylor(g, 'ExpansionPoint', 2, 'Order', 12);
% generate the first 12 nonzero terms of the Taylor series for g about x = 2.

xd = 1:0.05:3;
yd = subs(g,x,xd);
fplot(t, [1, 3])
hold on
plot(xd, yd, 'r-.')
title('Taylor approximation vs. actual function')
legend('Taylor','Function')
% Plor the functions the actual function versus the Tayor Approximation




