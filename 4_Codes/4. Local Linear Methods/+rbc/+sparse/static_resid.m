function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = rbc.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(7, 1);
    residual(1) = (1/y(2)) - (T(1)*T(4));
    residual(2) = (y(2)*params(2)/(1-y(5))) - ((1-params(4))*T(5)*T(6)*T(7));
    residual(3) = (y(2)+y(4)) - (y(1));
    residual(4) = (y(1)) - (T(3)*T(5));
    residual(5) = (y(4)) - (y(3)-y(3)*(1-params(3)));
    residual(6) = (y(6)) - (params(4)*y(1)/y(3));
    residual(7) = (y(7)) - (y(7)*params(5)+x(1));
end
