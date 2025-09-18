% CUBIC SPLINES 

% On each interval [xi-1, xi], s(x) will be a cubic ai +
% bix + cix2 + dix3. A cubic spline is represented in a computer as a list 
% of the ai, bi, ci, and di coefficients along with a list of the xi nodes. 
% We therefore have n intervals, n + 1 data points, and 4n unknown coefficients, 
% ai, bi, ci, di, i = 1,..., n.

% How to find the coefficients?

% First observe that the interpolating conditions plus continuity at the
% interior nodes implies 2n conditions on the coefficients:
% yi = ai+bixi+cixi2+dixi3 i = 1,...,n
% yi = ai+1+bi+1xi+ci+1ci2+di+1xi3, i =0,...,n-1
% This conditions also mean that the polynomial pieces must connect each
% other

% Since the approximations is to be C2 at the interior of the nodes . The
% first and the second derivatives must agree at the nodes, implying 2n-2
% conditions to be hold
% bi+2cixi+3dixi^2 = bi+1+2ci+1xi+3di+1xi^2, i = 1,...,n-1
% 2ci + 6dixi = 2ci+1 + 6 di+1xi, i = 1,...,n-1

% Therefore we have 4n-2 conditions and 4n unknown parameters 

% In order to find the 4n unknown parameters we need twho more conditions,
% this conditions are such that s'(x0) = s'(xn) = 0;


% Use the buil-in function to cubic interpolation
x = 0:pi/4:2*pi;   % The vector of x
v = sin(x);        % The corresponding values of y
xq = 0:pi/16:2*pi; % Coordinates of the query points

vq = spline(x,v,xq); % Linear Interpolation

% Show the picture
plot(x,v,'o',xq,vq,':.');
xlim([0 2*pi]);
title('Cubic Spline Interpolation');

