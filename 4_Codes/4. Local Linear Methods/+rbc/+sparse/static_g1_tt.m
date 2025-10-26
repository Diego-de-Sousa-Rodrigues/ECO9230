function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = rbc.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 9
    T = [T; NaN(9 - size(T, 1), 1)];
end
T(8) = getPowerDeriv(y(3),params(4),1);
T(9) = getPowerDeriv(exp(y(7))*y(5),1-params(4),1);
end
