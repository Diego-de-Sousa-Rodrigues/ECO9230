function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = growth_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(4, 1);
    residual(1) = (y(1)) - (params(1)*y(3)+y(4));
    residual(2) = (y(3)) - (1/(params(1)*params(2))*y(1)-(1/(params(1)*params(2))-1)*y(2));
    residual(3) = (y(2)) - (y(2)-y(4)*params(3)+y(3)*(1-params(1)));
    residual(4) = (y(4)) - (y(4)*params(3)+x(1));
end
