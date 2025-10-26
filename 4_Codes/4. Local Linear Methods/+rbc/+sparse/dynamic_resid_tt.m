function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = params(1)*1/y(16);
T(2) = params(4)*y(10)^(params(4)-1);
T(3) = (exp(y(21))*y(19))^(1-params(4));
T(4) = 1+T(2)*T(3)-params(3);
T(5) = y(3)^params(4);
T(6) = exp(y(14))^(1-params(4));
T(7) = y(12)^(-params(4));
T(8) = (y(12)*exp(y(14)))^(1-params(4));
end
