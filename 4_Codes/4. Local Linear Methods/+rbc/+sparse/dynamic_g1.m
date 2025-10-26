function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(11, 1);
end
[T_order, T] = rbc.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(25, 1);
g1_v(1)=(-(T(7)*T(6)*(1-params(4))*T(9)));
g1_v(2)=(-(T(8)*T(9)));
g1_v(3)=1-params(3);
g1_v(4)=(-params(5));
g1_v(5)=(-1);
g1_v(6)=1;
g1_v(7)=(-(params(4)/y(10)));
g1_v(8)=(-1)/(y(9)*y(9));
g1_v(9)=params(2)/(1-y(12));
g1_v(10)=1;
g1_v(11)=(-(T(1)*T(3)*params(4)*getPowerDeriv(y(10),params(4)-1,1)));
g1_v(12)=(-1);
g1_v(13)=(-((-(params(4)*y(8)))/(y(10)*y(10))));
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=y(9)*params(2)/((1-y(12))*(1-y(12)))-(1-params(4))*T(5)*T(6)*getPowerDeriv(y(12),(-params(4)),1);
g1_v(17)=(-(T(5)*exp(y(14))*T(10)));
g1_v(18)=1;
g1_v(19)=(-(T(7)*(1-params(4))*T(5)*exp(y(14))*getPowerDeriv(exp(y(14)),1-params(4),1)));
g1_v(20)=(-(T(5)*y(12)*exp(y(14))*T(10)));
g1_v(21)=1;
g1_v(22)=(-(T(4)*params(1)*(-1)/(y(16)*y(16))));
g1_v(23)=(-(T(1)*T(2)*exp(y(21))*T(11)));
g1_v(24)=(-(T(1)*T(2)*exp(y(21))*y(19)*T(11)));
g1_v(25)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 22);
end
