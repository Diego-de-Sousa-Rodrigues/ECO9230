% interp1_demo.m  Linear interpolation of a sine function
x  = 0:pi/4:2*pi;    % sample points
v  = sin(x);         % values at sample points
xq = 0:pi/16:2*pi;   % query points (can be same or finer)
vq = interp1(x, v, xq);   % Linear interpolation
plot(x, v, 'o', xq, vq, ':.'); grid on
title('Linear Interpolation'); xlim([0 2*pi]);
