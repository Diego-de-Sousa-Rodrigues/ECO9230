function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(17)=params(6)*y(8)+x(1);
  y(18)=params(7)*y(9)+x(2);
end
