function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(5, 1);
  residual(1)=(y(9)+y(11))-(y(8));
  T(1)=y(3)^params(4);
  T(2)=exp(y(14));
  T(3)=(y(12)*T(2))^(1-params(4));
  residual(2)=(y(8))-(T(1)*T(3));
  residual(3)=(y(11))-(y(10)-y(3)*(1-params(3)));
  T(4)=T(2)^(1-params(4));
  T(5)=y(12)^(-params(4));
  residual(4)=(y(9)*params(2)/(1-y(12)))-((1-params(4))*T(1)*T(4)*T(5));
  T(6)=params(4)*y(10)^(params(4)-1);
  T(7)=exp(y(21));
  T(8)=(T(7)*y(19))^(1-params(4));
  residual(5)=(1/y(9))-(params(1)*1/y(16)*(1+T(6)*T(8)-params(3)));
  T(9)=getPowerDeriv(y(3),params(4),1);
if nargout > 3
    g1_v = NaN(16, 1);
g1_v(1)=(-(T(3)*T(9)));
g1_v(2)=1-params(3);
g1_v(3)=(-(T(5)*T(4)*(1-params(4))*T(9)));
g1_v(4)=1;
g1_v(5)=1;
g1_v(6)=(-1);
g1_v(7)=1;
g1_v(8)=(-1);
g1_v(9)=(-(params(1)*1/y(16)*T(8)*params(4)*getPowerDeriv(y(10),params(4)-1,1)));
g1_v(10)=(-(T(1)*T(2)*getPowerDeriv(y(12)*T(2),1-params(4),1)));
g1_v(11)=y(9)*params(2)/((1-y(12))*(1-y(12)))-(1-params(4))*T(1)*T(4)*getPowerDeriv(y(12),(-params(4)),1);
g1_v(12)=1;
g1_v(13)=params(2)/(1-y(12));
g1_v(14)=(-1)/(y(9)*y(9));
g1_v(15)=(-(params(1)*1/y(16)*T(6)*T(7)*getPowerDeriv(T(7)*y(19),1-params(4),1)));
g1_v(16)=(-((1+T(6)*T(8)-params(3))*params(1)*(-1)/(y(16)*y(16))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 5, 15);
end
end
