% Generates a interpolation of a univariate function, using the Cubic
% Splines

x = 0:5;
y = 1./(1 + x.^2);
xi = linspace(0, 5);
yi = spline(x, y, xi);
plot(x, y, 'o', xi, yi), title('Cubic spline interpolant')