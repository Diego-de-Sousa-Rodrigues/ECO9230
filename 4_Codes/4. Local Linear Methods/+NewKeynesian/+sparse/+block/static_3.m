function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(9, 1);
  residual(1)=(y(5))-((1-params(5))*y(5)+params(5)*y(2));
  residual(2)=(y(1))-(y(11)+params(3)*y(5)+(1-params(3))*y(7));
  residual(3)=(y(5))-(y(1)-y(4));
  residual(4)=(y(7))-(y(1)-y(6));
  residual(5)=(y(8))-((1-params(3))*y(6)+params(3)*y(4)-y(11));
  residual(6)=(y(10))-(params(4)*y(10)+(1-params(4)*params(8))*(1-params(8))/params(8)*(y(8)-y(9)));
  residual(7)=(params(1)*y(3)+params(2)*y(7))-(y(6)-y(9));
  T(1)=1/params(4)-(1-params(5));
  T(2)=(1-params(3))*((params(7)-1)/params(7)*(1-params(4)*params(8)))^(1/(1-params(3)))*(params(3)/T(1))^(params(3)/(1-params(3)));
  T(3)=T(2)*(T(2)/((params(7)-1)/params(7)*(1-params(4)*params(8))*(1-params(3))))^params(2);
  T(4)=(T(1)/(T(1)-(params(7)-1)/params(7)*(1-params(4)*params(8))*params(5)*params(3)))^(params(1)/(params(1)+params(2)))*T(3)^(1/(params(1)+params(2)));
  T(5)=T(4)*(params(7)-1)/params(7)*(1-params(4)*params(8))*params(5)*params(3)/T(1);
  T(6)=1/T(4)^(params(2)/params(1))*T(3)^(1/params(1));
  residual(8)=(T(4)*y(1))-(T(6)*y(3)+T(5)*y(2));
  residual(9)=(0)-(T(1)*(y(4)-y(9)));
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=(-params(5));
g1_v(2)=(-T(5));
g1_v(3)=1;
g1_v(4)=(-1);
g1_v(5)=(-1);
g1_v(6)=T(4);
g1_v(7)=1-(1-params(5));
g1_v(8)=(-params(3));
g1_v(9)=1;
g1_v(10)=(-(1-params(3)));
g1_v(11)=1;
g1_v(12)=params(2);
g1_v(13)=1;
g1_v(14)=(-(1-params(3)));
g1_v(15)=(-1);
g1_v(16)=1;
g1_v(17)=(-((1-params(4)*params(8))*(1-params(8))/params(8)));
g1_v(18)=(1-params(4)*params(8))*(1-params(8))/params(8);
g1_v(19)=1;
g1_v(20)=T(1);
g1_v(21)=params(1);
g1_v(22)=(-T(6));
g1_v(23)=1;
g1_v(24)=(-params(3));
g1_v(25)=(-T(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 9, 9);
end
end
