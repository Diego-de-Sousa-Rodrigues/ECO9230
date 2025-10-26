function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(5))-(params(1)*y(3)+y(8));
  residual(2)=(y(6))-(y(10)-y(8)*params(3)+y(7)*(1-params(1)));
  residual(3)=(y(7))-(1/(params(1)*params(2))*y(5)-y(6)*(1/(params(1)*params(2))-1));
if nargout > 3
    g1_v = NaN(8, 1);
g1_v(1)=(-params(1));
g1_v(2)=1;
g1_v(3)=(-(1/(params(1)*params(2))));
g1_v(4)=(-(1-params(1)));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=1/(params(1)*params(2))-1;
g1_v(8)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
