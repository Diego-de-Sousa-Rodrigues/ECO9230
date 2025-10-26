function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = NewKeynesian.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(11, 1);
    residual(1) = (params(1)*y(3)+params(2)*y(7)) - (y(6)-y(9));
    residual(2) = (0) - (T(1)*(y(4)-y(9)));
    residual(3) = (y(5)) - ((1-params(5))*y(5)+params(5)*y(2));
    residual(4) = (y(1)) - (y(11)+params(3)*y(5)+(1-params(3))*y(7));
    residual(5) = (y(5)) - (y(1)-y(4));
    residual(6) = (y(7)) - (y(1)-y(6));
    residual(7) = (y(8)) - ((1-params(3))*y(6)+params(3)*y(4)-y(11));
    residual(8) = (y(10)) - (params(4)*y(10)+T(7)*(y(8)-y(9)));
residual(9) = y(10);
    residual(10) = (T(5)*y(1)) - (T(6)*y(3)+T(5)*T(2)*params(5)*params(3)/T(1)*y(2));
    residual(11) = (y(11)) - (y(11)*params(6)+x(1));
end
