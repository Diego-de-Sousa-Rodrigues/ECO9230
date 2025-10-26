function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = rbc.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(7, 1);
    residual(1) = (1/y(9)) - (T(1)*T(4));
    residual(2) = (y(9)*params(2)/(1-y(12))) - ((1-params(4))*T(5)*T(6)*T(7));
    residual(3) = (y(9)+y(11)) - (y(8));
    residual(4) = (y(8)) - (T(5)*T(8));
    residual(5) = (y(11)) - (y(10)-y(3)*(1-params(3)));
    residual(6) = (y(13)) - (params(4)*y(8)/y(10));
    residual(7) = (y(14)) - (params(5)*y(7)+x(1));
end
