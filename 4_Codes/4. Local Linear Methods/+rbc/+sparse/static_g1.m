function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(9, 1);
end
[T_order, T] = rbc.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(21, 1);
g1_v(1)=(-1);
g1_v(2)=1;
g1_v(3)=(-(params(4)/y(3)));
g1_v(4)=(-1)/(y(2)*y(2))-T(4)*params(1)*(-1)/(y(2)*y(2));
g1_v(5)=params(2)/(1-y(5));
g1_v(6)=1;
g1_v(7)=(-(T(1)*T(3)*params(4)*getPowerDeriv(y(3),params(4)-1,1)));
g1_v(8)=(-(T(7)*T(6)*(1-params(4))*T(8)));
g1_v(9)=(-(T(3)*T(8)));
g1_v(10)=(-(1-(1-params(3))));
g1_v(11)=(-((-(params(4)*y(1)))/(y(3)*y(3))));
g1_v(12)=1;
g1_v(13)=1;
g1_v(14)=(-(T(1)*T(2)*exp(y(7))*T(9)));
g1_v(15)=y(2)*params(2)/((1-y(5))*(1-y(5)))-(1-params(4))*T(5)*T(6)*getPowerDeriv(y(5),(-params(4)),1);
g1_v(16)=(-(T(5)*exp(y(7))*T(9)));
g1_v(17)=1;
g1_v(18)=(-(T(1)*T(2)*exp(y(7))*y(5)*T(9)));
g1_v(19)=(-(T(7)*(1-params(4))*T(5)*exp(y(7))*getPowerDeriv(exp(y(7)),1-params(4),1)));
g1_v(20)=(-(T(5)*exp(y(7))*y(5)*T(9)));
g1_v(21)=1-params(5);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
