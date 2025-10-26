function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = NewKeynesian.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(11, 1);
    residual(1) = (params(1)*y(14)+params(2)*y(18)) - (y(17)-y(20));
    residual(2) = (params(1)/params(4)*(y(25)-y(14))) - (T(1)*(y(26)-y(31)));
    residual(3) = (y(16)) - ((1-params(5))*y(5)+params(5)*y(13));
    residual(4) = (y(12)) - (y(22)+params(3)*y(5)+(1-params(3))*y(18));
    residual(5) = (y(5)) - (y(12)-y(15));
    residual(6) = (y(18)) - (y(12)-y(17));
    residual(7) = (y(19)) - ((1-params(3))*y(17)+params(3)*y(15)-y(22));
    residual(8) = (y(21)) - (params(4)*y(32)+T(3)*(y(19)-y(20)));
    residual(9) = (y(21)) - (y(20)-y(9));
    residual(10) = (y(12)*T(6)) - (y(14)*T(7)+y(13)*T(6)*T(2)*params(5)*params(3)/T(1));
    residual(11) = (y(22)) - (params(6)*y(11)+x(1));
end
