% Modelo RBC B�sico

close all;

%----------------------------------------------------------------
% Declarando as vari�veis
%----------------------------------------------------------------

var y c k i h r z;                                                                       % vari�veis end�genas
varexo e;                                                                                % vari�veis ex�genas

parameters beta psi delta theta rho;                                                     % par�metros

%----------------------------------------------------------------
% Declarando os par�metros
%----------------------------------------------------------------

theta   = 0.33;                                                                          % capital-share
beta    = 0.99;                                                                          % taxa de desconto temporal
delta   = 0.025;                                                                         % deprecia��o
psi     = 1.72;                                                                          % par�metro de utilidade do lazer
rho     = 0.95;                                                                          % AR(1) da produtividade
sigma   = (0.000010299)^(1/2);                                                           % desvio-padr�o do choque de produtividade  

%----------------------------------------------------------------
% O Modelo
%----------------------------------------------------------------

model; 
  (1/c) = beta*(1/c(+1))*(1+theta*(k^(theta-1))*(exp(z(+1))*h(+1))^(1-theta)-delta);     % escolha intertemporal do consumo
  psi*c/(1-h) = (1-theta)*(k(-1)^theta)*(exp(z)^(1-theta))*(h^(-theta));                 % escolha renda-lazer
  c+i = y;                                                                               % restri��o or�ament�ria
  y = (k(-1)^theta)*(exp(z)*h)^(1-theta);                                                % fun��o de produ��o
  i = k-(1-delta)*k(-1);                                                                 % equa��o de movimento do capital
  r = theta*y/k;                                                                         % taxa de juros
  z = rho*z(-1)+e;                                                                       % processo estoc�stico da produtividade
end;

%----------------------------------------------------------------
% Valores Iniciais (Usualmente os de Steady-State)
%----------------------------------------------------------------

initval;
y = 1.2353;
k = 12.6695;
c = 0.9186;
h = 0.33;
i = 0.316738;
z = 0;
e = 0;
r = 0.0351;
end;

shocks;
var e = sigma^2;
end;

steady;

stoch_simul(hp_filter = 1600, order = 1);

%----------------------------------------------------------------
% Resultados Adicionais
%----------------------------------------------------------------

statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable('Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);
