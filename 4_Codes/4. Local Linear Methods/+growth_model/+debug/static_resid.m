function [lhs, rhs] = static_resid(y, x, params)
T = NaN(0, 1);
lhs = NaN(4, 1);
rhs = NaN(4, 1);
lhs(1) = y(1);
rhs(1) = params(1)*y(3)+y(4);
lhs(2) = y(3);
rhs(2) = 1/(params(1)*params(2))*y(1)-(1/(params(1)*params(2))-1)*y(2);
lhs(3) = y(2);
rhs(3) = y(2)-y(4)*params(3)+y(3)*(1-params(1));
lhs(4) = y(4);
rhs(4) = y(4)*params(3)+x(1);
end
