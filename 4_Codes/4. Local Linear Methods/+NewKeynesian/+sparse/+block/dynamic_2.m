function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  y(18)=y(12)-y(17);
  y(19)=(1-params(3))*y(17)+params(3)*y(15)-y(22);
  residual(1)=(y(12))-(y(22)+params(3)*y(5)+(1-params(3))*y(18));
  T(1)=1/params(4)-(1-params(5));
  T(2)=(1-params(3))*((params(7)-1)/params(7)*(1-params(4)*params(8)))^(1/(1-params(3)))*(params(3)/T(1))^(params(3)/(1-params(3)));
  T(3)=T(2)*(T(2)/((params(7)-1)/params(7)*(1-params(4)*params(8))*(1-params(3))))^params(2);
  T(4)=(T(1)/(T(1)-(params(7)-1)/params(7)*(1-params(4)*params(8))*params(5)*params(3)))^(params(1)/(params(1)+params(2)))*T(3)^(1/(params(1)+params(2)));
  T(5)=T(4)*(params(7)-1)/params(7)*(1-params(4)*params(8))*params(5)*params(3)/T(1);
  T(6)=1/T(4)^(params(2)/params(1))*T(3)^(1/params(1));
  residual(2)=(y(12)*T(4))-(y(14)*T(6)+y(13)*T(5));
  residual(3)=(params(1)*y(14)+params(2)*y(18))-(y(17)-y(20));
  residual(4)=(y(16))-((1-params(5))*y(5)+params(5)*y(13));
  residual(5)=(y(21))-(y(20)-y(9));
  residual(6)=(params(1)/params(4)*(y(25)-y(14)))-(T(1)*(y(26)-y(31)));
  residual(7)=(y(5))-(y(12)-y(15));
  residual(8)=(y(21))-(params(4)*y(32)+(1-params(4)*params(8))*(1-params(8))/params(8)*(y(19)-y(20)));
if nargout > 3
    g1_v = NaN(28, 1);
g1_v(1)=(-params(3));
g1_v(2)=(-(1-params(5)));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=1-(1-params(3));
g1_v(6)=T(4);
g1_v(7)=params(2);
g1_v(8)=(-1);
g1_v(9)=(-T(5));
g1_v(10)=(-params(5));
g1_v(11)=1-params(3);
g1_v(12)=(-params(2))-1;
g1_v(13)=(-((1-params(3))*(1-params(4)*params(8))*(1-params(8))/params(8)));
g1_v(14)=1;
g1_v(15)=1;
g1_v(16)=(-1);
g1_v(17)=(1-params(4)*params(8))*(1-params(8))/params(8);
g1_v(18)=(-T(6));
g1_v(19)=params(1);
g1_v(20)=(-(params(1)/params(4)));
g1_v(21)=1;
g1_v(22)=(-(params(3)*(1-params(4)*params(8))*(1-params(8))/params(8)));
g1_v(23)=1;
g1_v(24)=1;
g1_v(25)=T(1);
g1_v(26)=params(1)/params(4);
g1_v(27)=(-T(1));
g1_v(28)=(-params(4));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 24);
end
end
