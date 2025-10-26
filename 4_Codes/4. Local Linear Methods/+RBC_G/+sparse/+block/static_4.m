function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  residual(1)=(y(1))-(y(8)+params(3)*y(5)+(1-params(3))*y(7));
  residual(2)=(y(4))-(y(1)-y(5));
  residual(3)=(y(6))-(y(1)-y(7));
  T(1)=((1/params(4)-(1-params(5)))/(1/params(4)-(1-params(5))-params(5)*params(3)))^(params(1)/(params(1)+params(2)))*((1-params(3))^(-params(2))*((1-params(3))*(params(3)/(1/params(4)-(1-params(5))))^(params(3)/(1-params(3))))^(1+params(2)))^(1/(params(1)+params(2)));
  residual(4)=(T(1)*y(1))-((T(1)-T(1)*params(5)*params(3)/(1/params(4)-(1-params(5))))*y(3)+T(1)*params(5)*params(3)/(1/params(4)-(1-params(5)))*y(2)+T(1)*0.20*y(9));
  residual(5)=(params(1)*y(3)+params(2)*y(7))-(y(6));
  residual(6)=(y(5))-((1-params(5))*y(5)+params(5)*y(2));
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=1;
g1_v(2)=(-1);
g1_v(3)=(-1);
g1_v(4)=T(1);
g1_v(5)=(-params(3));
g1_v(6)=1;
g1_v(7)=1-(1-params(5));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(T(1)-T(1)*params(5)*params(3)/(1/params(4)-(1-params(5)))));
g1_v(11)=params(1);
g1_v(12)=(-(1-params(3)));
g1_v(13)=1;
g1_v(14)=params(2);
g1_v(15)=(-(T(1)*params(5)*params(3)/(1/params(4)-(1-params(5)))));
g1_v(16)=(-params(5));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
