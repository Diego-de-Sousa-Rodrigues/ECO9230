function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(9))-(y(16)+params(3)*y(5)+(1-params(3))*y(15));
  residual(2)=(y(14))-(y(9)-y(15));
  T(1)=((1/params(4)-(1-params(5)))/(1/params(4)-(1-params(5))-params(5)*params(3)))^(params(1)/(params(1)+params(2)))*((1-params(3))^(-params(2))*((1-params(3))*(params(3)/(1/params(4)-(1-params(5))))^(params(3)/(1-params(3))))^(1+params(2)))^(1/(params(1)+params(2)));
  residual(3)=(y(9)*T(1))-(y(11)*(T(1)-T(1)*params(5)*params(3)/(1/params(4)-(1-params(5))))+y(10)*T(1)*params(5)*params(3)/(1/params(4)-(1-params(5))));
  residual(4)=(params(1)*y(11)+params(2)*y(15))-(y(14));
  residual(5)=(y(13))-((1-params(5))*y(5)+params(5)*y(10));
  residual(6)=(params(1)/params(4)*(y(19)-y(11)))-((1/params(4)-(1-params(5)))*y(20));
  residual(7)=(y(12))-(y(9)-y(5));
if nargout > 3
    g1_v = NaN(21, 1);
g1_v(1)=(-params(3));
g1_v(2)=(-(1-params(5)));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=(-1);
g1_v(6)=T(1);
g1_v(7)=(-1);
g1_v(8)=(-(1-params(3)));
g1_v(9)=1;
g1_v(10)=params(2);
g1_v(11)=(-(T(1)*params(5)*params(3)/(1/params(4)-(1-params(5)))));
g1_v(12)=(-params(5));
g1_v(13)=1;
g1_v(14)=(-1);
g1_v(15)=1;
g1_v(16)=(-(T(1)-T(1)*params(5)*params(3)/(1/params(4)-(1-params(5)))));
g1_v(17)=params(1);
g1_v(18)=(-(params(1)/params(4)));
g1_v(19)=1;
g1_v(20)=params(1)/params(4);
g1_v(21)=(-(1/params(4)-(1-params(5))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
