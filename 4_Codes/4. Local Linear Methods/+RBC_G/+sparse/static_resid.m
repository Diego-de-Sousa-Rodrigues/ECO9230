function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(2, 1);
end
[T_order, T] = RBC_G.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(9, 1);
    residual(1) = (params(1)*y(3)+params(2)*y(7)) - (y(6));
    residual(2) = (0) - (T(1)*y(4));
    residual(3) = (y(5)) - ((1-params(5))*y(5)+params(5)*y(2));
    residual(4) = (y(1)) - (y(8)+params(3)*y(5)+(1-params(3))*y(7));
    residual(5) = (y(4)) - (y(1)-y(5));
    residual(6) = (y(6)) - (y(1)-y(7));
    residual(7) = (T(2)*y(1)) - ((T(2)-T(2)*params(5)*params(3)/T(1))*y(3)+T(2)*params(5)*params(3)/T(1)*y(2)+T(2)*0.20*y(9));
    residual(8) = (y(8)) - (y(8)*params(6)+x(1));
    residual(9) = (y(9)) - (y(9)*params(7)+x(2));
end
