function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = 1/params(4)-(1-params(5));
T(2) = (params(7)-1)/params(7)*(1-params(4)*params(8));
T(3) = (1-params(3))*T(2)^(1/(1-params(3)))*(params(3)/T(1))^(params(3)/(1-params(3)));
T(4) = T(3)*(T(3)/(T(2)*(1-params(3))))^params(2);
T(5) = (T(1)/(T(1)-T(2)*params(5)*params(3)))^(params(1)/(params(1)+params(2)))*T(4)^(1/(params(1)+params(2)));
T(6) = 1/T(5)^(params(2)/params(1))*T(4)^(1/params(1));
T(7) = (1-params(4)*params(8))*(1-params(8))/params(8);
end
