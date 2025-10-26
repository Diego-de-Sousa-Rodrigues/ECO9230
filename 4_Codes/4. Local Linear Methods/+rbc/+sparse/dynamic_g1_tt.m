function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = rbc.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 11
    T = [T; NaN(11 - size(T, 1), 1)];
end
T(9) = getPowerDeriv(y(3),params(4),1);
T(10) = getPowerDeriv(y(12)*exp(y(14)),1-params(4),1);
T(11) = getPowerDeriv(exp(y(21))*y(19),1-params(4),1);
end
