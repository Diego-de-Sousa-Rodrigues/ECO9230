function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = RBC_G.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(9, 1);
    residual(1) = (params(1)*y(12)+params(2)*y(16)) - (y(15));
    residual(2) = (params(1)/params(4)*(y(21)-y(12))) - (T(1)*y(22));
    residual(3) = (y(14)) - ((1-params(5))*y(5)+params(5)*y(11));
    residual(4) = (y(10)) - (y(17)+params(3)*y(5)+(1-params(3))*y(16));
    residual(5) = (y(13)) - (y(10)-y(5));
    residual(6) = (y(15)) - (y(10)-y(16));
    residual(7) = (y(10)*T(2)) - (y(12)*(T(2)-T(2)*params(5)*params(3)/T(1))+y(11)*T(2)*params(5)*params(3)/T(1)+y(18)*0.20*T(2));
    residual(8) = (y(17)) - (params(6)*y(8)+x(1));
    residual(9) = (y(18)) - (params(7)*y(9)+x(2));
end
