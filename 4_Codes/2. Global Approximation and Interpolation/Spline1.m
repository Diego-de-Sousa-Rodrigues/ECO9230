% Spline Interpolation

% It is used to correct the defficiency of the linear method, since in the
% last case it produces a non differentiable interpolant.

% Splines are different way to interpolate that can produce a interpolante
% that is continuously differentiable up to a given order

% They take piecewise polynomial within each intervak [xi, xi+1]

% DEFINITION: Formally a function s(x) on [a, b] is a spline of order n if s is Cn-2 on
% [a, b], and there is a grid of points (called nodes) a = x0 < x1 < ... < 
% xm = b such that s(x) is a polynomial of degree n - 1 on each 
% subinterval [xi, xi+1], i = 0,..., m - 1.

% A Spline of order 2 is the linear method described in the previous file

% A Spline of order 3 is the parabola ans the entire spline is C1

% A Spline of order 4 is such that each interval is a cubic and the entire
% space is C2 - This is the most popular


