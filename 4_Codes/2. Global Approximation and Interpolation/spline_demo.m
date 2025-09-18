% spline_demo.m  Cubic spline interpolation of a sine function
x  = 0:pi/4:2*pi;          % breakpoints
v  = sin(x);               % data at breakpoints
xq = 0:pi/32:2*pi;         % query points (finer grid)
vq = spline(x, v, xq);     % cubic spline interpolation
plot(x, v, 'o', xq, vq, ':.'); grid on
title('Cubic spline vs. data'); xlim([0, 2*pi]);
