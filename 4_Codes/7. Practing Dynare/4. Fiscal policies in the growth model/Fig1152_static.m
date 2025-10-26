function [residual, g1, g2] = Fig1152_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                     columns: variables in declaration order
%                                                     rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 7, 1);

%
% Model equations
%

T26 = y(1)^(-params(2))*params(1);
T39 = y(2)^(params(4)-1);
T41 = (1-params(3))*(1-x(1))/(1-x(1))+params(5)*params(4)*(1-x(3))/(1-x(1))*T39;
T75 = getPowerDeriv(y(2),params(4)-1,1);
lhs =y(2);
rhs =params(5)*y(2)^params(4)+y(2)*(1-params(3))-y(1)-x(4);
residual(1)= lhs-rhs;
lhs =y(1)^(-params(2));
rhs =T26*T41;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =T39*params(5)*params(4);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =params(5)*y(2)^params(4)-T39*params(5)*y(2)*params(4);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =T41;
residual(5)= lhs-rhs;
lhs =y(6);
rhs =1-params(3)+T39*params(5)*params(4)*(1-x(3));
residual(6)= lhs-rhs;
lhs =y(7);
rhs =T26/(1+x(2));
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=1-(1-params(3)+params(5)*getPowerDeriv(y(2),params(4),1));
  g1(2,1)=getPowerDeriv(y(1),(-params(2)),1)-T41*params(1)*getPowerDeriv(y(1),(-params(2)),1);
  g1(2,2)=(-(T26*params(5)*params(4)*(1-x(3))/(1-x(1))*T75));
  g1(3,2)=(-(params(5)*params(4)*T75));
  g1(3,3)=1;
  g1(4,2)=(-(params(5)*getPowerDeriv(y(2),params(4),1)-(T39*params(5)*params(4)+params(5)*y(2)*params(4)*T75)));
  g1(4,4)=1;
  g1(5,2)=(-(params(5)*params(4)*(1-x(3))/(1-x(1))*T75));
  g1(5,5)=1;
  g1(6,2)=(-(params(5)*params(4)*(1-x(3))*T75));
  g1(6,6)=1;
  g1(7,1)=(-(params(1)*getPowerDeriv(y(1),(-params(2)),1)/(1+x(2))));
  g1(7,7)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,49);
end
end
