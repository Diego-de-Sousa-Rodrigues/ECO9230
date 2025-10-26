function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(7, 1);
end
[T_order, T] = NewKeynesian.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(38, 1);
g1_v(1)=(-(1-params(5)));
g1_v(2)=(-params(3));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-params(6));
g1_v(6)=1;
g1_v(7)=(-1);
g1_v(8)=(-1);
g1_v(9)=T(6);
g1_v(10)=(-params(5));
g1_v(11)=(-(T(6)*T(2)*params(5)*params(3)/T(1)));
g1_v(12)=params(1);
g1_v(13)=(-(params(1)/params(4)));
g1_v(14)=(-T(7));
g1_v(15)=1;
g1_v(16)=(-params(3));
g1_v(17)=1;
g1_v(18)=(-1);
g1_v(19)=1;
g1_v(20)=(-(1-params(3)));
g1_v(21)=params(2);
g1_v(22)=(-(1-params(3)));
g1_v(23)=1;
g1_v(24)=1;
g1_v(25)=(-T(3));
g1_v(26)=1;
g1_v(27)=T(3);
g1_v(28)=(-1);
g1_v(29)=1;
g1_v(30)=1;
g1_v(31)=(-1);
g1_v(32)=1;
g1_v(33)=1;
g1_v(34)=params(1)/params(4);
g1_v(35)=(-T(1));
g1_v(36)=T(1);
g1_v(37)=(-params(4));
g1_v(38)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 11, 34);
end
