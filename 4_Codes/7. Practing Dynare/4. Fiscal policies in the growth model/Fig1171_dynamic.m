function [residual, g1, g2, g3] = Fig1171_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(7, 1);
T29 = params(1)*y(9)^(-params(2));
T34 = (1+x(it_-1, 2))/(1+x(it_, 2));
T35 = T29*T34;
T48 = y(1)^(params(4)-1);
T50 = (1-params(3))*(1-x(it_, 1))/(1-x(it_-1, 1))+params(5)*params(4)*(1-x(it_, 3))/(1-x(it_-1, 1))*T48;
T55 = y(3)^(params(4)-1);
T93 = params(5)*params(4)*(1-x(it_, 3))/(1-x(it_-1, 1))*getPowerDeriv(y(1),params(4)-1,1);
T98 = getPowerDeriv(y(3),params(4)-1,1);
T117 = (1-params(3))*(1-x(it_, 1))/((1-x(it_-1, 1))*(1-x(it_-1, 1)))+T48*params(5)*params(4)*(1-x(it_, 3))/((1-x(it_-1, 1))*(1-x(it_-1, 1)));
lhs =y(3);
rhs =params(5)*y(1)^params(4)+y(1)*(1-params(3))-y(2)-x(it_, 4);
residual(1)= lhs-rhs;
lhs =y(2)^(-params(2));
rhs =T35*T50;
residual(2)= lhs-rhs;
lhs =y(4);
rhs =params(5)*params(4)*T55;
residual(3)= lhs-rhs;
lhs =y(5);
rhs =params(5)*y(3)^params(4)-T55*params(5)*y(3)*params(4);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =T34*T50;
residual(5)= lhs-rhs;
lhs =y(7);
rhs =1-params(3)+T55*params(5)*params(4)*(1-x(it_, 3));
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(2)^(-params(2))*params(1)/(1+x(it_, 2));
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 13);

  %
  % Jacobian matrix
  %

  g1(1,2)=1;
  g1(1,1)=(-(1-params(3)+params(5)*getPowerDeriv(y(1),params(4),1)));
  g1(1,3)=1;
  g1(1,13)=1;
  g1(2,2)=getPowerDeriv(y(2),(-params(2)),1);
  g1(2,9)=(-(T50*T34*params(1)*getPowerDeriv(y(9),(-params(2)),1)));
  g1(2,1)=(-(T35*T93));
  g1(2,10)=(-(T35*T117));
  g1(2,10)=(-(T35*(-(1-params(3)))/(1-x(it_-1, 1))));
  g1(2,11)=(-(T50*T29*1/(1+x(it_, 2))));
  g1(2,11)=(-(T50*T29*(-(1+x(it_-1, 2)))/((1+x(it_, 2))*(1+x(it_, 2)))));
  g1(2,12)=(-(T35*T48*params(5)*params(4)*(-1)/(1-x(it_-1, 1))));
  g1(3,3)=(-(params(5)*params(4)*T98));
  g1(3,4)=1;
  g1(4,3)=(-(params(5)*getPowerDeriv(y(3),params(4),1)-(params(5)*params(4)*T55+params(5)*y(3)*params(4)*T98)));
  g1(4,5)=1;
  g1(5,1)=(-(T34*T93));
  g1(5,6)=1;
  g1(5,10)=(-(T34*T117));
  g1(5,10)=(-(T34*(-(1-params(3)))/(1-x(it_-1, 1))));
  g1(5,11)=(-(T50*1/(1+x(it_, 2))));
  g1(5,11)=(-(T50*(-(1+x(it_-1, 2)))/((1+x(it_, 2))*(1+x(it_, 2)))));
  g1(5,12)=(-(T34*T48*params(5)*params(4)*(-1)/(1-x(it_-1, 1))));
  g1(6,3)=(-(params(5)*params(4)*(1-x(it_, 3))*T98));
  g1(6,7)=1;
  g1(6,12)=(-(T55*params(5)*(-params(4))));
  g1(7,2)=(-(params(1)*getPowerDeriv(y(2),(-params(2)),1)/(1+x(it_, 2))));
  g1(7,8)=1;
  g1(7,11)=(-((-(y(2)^(-params(2))*params(1)))/((1+x(it_, 2))*(1+x(it_, 2)))));
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],7,169);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],7,2197);
end
end
