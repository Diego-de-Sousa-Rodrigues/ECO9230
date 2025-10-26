function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(0, 1);
lhs = NaN(4, 1);
rhs = NaN(4, 1);
lhs(1) = y(5);
rhs(1) = params(1)*y(3)+y(8);
lhs(2) = y(7);
rhs(2) = 1/(params(1)*params(2))*y(5)-y(6)*(1/(params(1)*params(2))-1);
lhs(3) = y(6);
rhs(3) = y(10)-y(8)*params(3)+y(7)*(1-params(1));
lhs(4) = y(8);
rhs(4) = params(3)*y(4)+x(1);
end
