function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = 1/y(2)*params(1);
T(2) = params(4)*y(3)^(params(4)-1);
T(3) = (exp(y(7))*y(5))^(1-params(4));
T(4) = 1+T(2)*T(3)-params(3);
T(5) = y(3)^params(4);
T(6) = exp(y(7))^(1-params(4));
T(7) = y(5)^(-params(4));
end
