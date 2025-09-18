% Piece-wise Linear Interpolation

% Connecting the points
% Draw straight lines between successive data points
% Piece-wise interpolant is given by:
% f(x) hat = yi + (yi+1-yi/xi+1-xi)*(x-xi) for all x belongs to [xi, xi+1]


% We can use the following built-in function to interpolate data. 
% vq = interp1(x,v,xq) returns interpolated values of a 1-D function at specific 
% query points using linear interpolation. Vector x contains the sample 
% points, and v contains the corresponding values, v(x). Vector xq contains 
% the coordinates of the query points.

% Generates a linear approximation of a sine function
x = 0:pi/4:2*pi;   % The vector of x
v = sin(x);        % The corresponding values of y
xq = 0:pi/16:2*pi; % Coordinates of the query points

vq = interp1(x,v,xq); % Observe that the default method is linear. If we 
% want another procedure we have to change the method in the previous built
% in function

% Show the picture
plot(x,v,'o',xq,vq,':.');
xlim([0 2*pi]);
title('Linear Interpolation');

% Advantages of this method
% Very simple ans fast
% Preserves quasi-concavity and monotonicity
% Easily generalize to multidimensionak case

% Disaedvantages of this method
% Does not preserve differentiability

