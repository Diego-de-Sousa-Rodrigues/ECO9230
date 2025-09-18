% linear_vs_cubic_spline.m  Compare linear vs cubic spline
x   = 0:pi/4:2*pi;           % breakpoints
v   = sin(x);                % data at breakpoints
xq  = 0:pi/16:2*pi;          % query grid (finer)

v_lin = interp1(x, v, xq);   % linear interpolation
v_cub = spline(x, v, xq);    % cubic spline interpolation

plot(x, v, 'o', xq, v_lin, '--', xq, v_cub, '-.'); grid on
legend('data','linear','cubic spline','Location','best')
title('Linear vs. Cubic Spline Interpolation'); xlim([0 2*pi]);
