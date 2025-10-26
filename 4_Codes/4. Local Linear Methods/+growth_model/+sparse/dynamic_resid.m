function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = growth_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(4, 1);
    residual(1) = (y(5)) - (params(1)*y(3)+y(8));
    residual(2) = (y(7)) - (1/(params(1)*params(2))*y(5)-y(6)*(1/(params(1)*params(2))-1));
    residual(3) = (y(6)) - (y(10)-y(8)*params(3)+y(7)*(1-params(1)));
    residual(4) = (y(8)) - (params(3)*y(4)+x(1));
end
