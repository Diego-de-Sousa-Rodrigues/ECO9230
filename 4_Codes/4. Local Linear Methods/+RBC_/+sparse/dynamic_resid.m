function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = RBC_.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (params(1)*y(11)+params(2)*y(15)) - (y(14));
    residual(2) = (params(1)/params(4)*(y(19)-y(11))) - (T(1)*y(20));
    residual(3) = (y(13)) - ((1-params(5))*y(5)+params(5)*y(10));
    residual(4) = (y(9)) - (y(16)+params(3)*y(5)+(1-params(3))*y(15));
    residual(5) = (y(12)) - (y(9)-y(5));
    residual(6) = (y(14)) - (y(9)-y(15));
    residual(7) = (y(9)*T(2)) - (y(11)*(T(2)-T(2)*params(5)*params(3)/T(1))+y(10)*T(2)*params(5)*params(3)/T(1));
    residual(8) = (y(16)) - (params(6)*y(8)+x(1));
end
