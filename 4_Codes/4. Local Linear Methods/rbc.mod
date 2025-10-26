% Modelo RBC Básico

close all;

%----------------------------------------------------------------
% Declarando as variáveis
%----------------------------------------------------------------

var y c k i h r z;                                                                       % variáveis endógenas
varexo e;                                                                                % variáveis exógenas

parameters beta psi delta theta rho;                                                     % parâmetros

%----------------------------------------------------------------
% Declarando os parâmetros
%----------------------------------------------------------------

theta   = 0.33;                                                                          % capital-share
beta    = 0.99;                                                                          % taxa de desconto temporal
delta   = 0.025;                                                                         % depreciação
psi     = 1.72;                                                                          % parâmetro de utilidade do lazer
rho     = 0.95;                                                                          % AR(1) da produtividade
sigma   = (0.000010299)^(1/2);                                                           % desvio-padrão do choque de produtividade  

%----------------------------------------------------------------
% O Modelo
%----------------------------------------------------------------

model; 
  (1/c) = beta*(1/c(+1))*(1+theta*(k^(theta-1))*(exp(z(+1))*h(+1))^(1-theta)-delta);     % escolha intertemporal do consumo
  psi*c/(1-h) = (1-theta)*(k(-1)^theta)*(exp(z)^(1-theta))*(h^(-theta));                 % escolha renda-lazer
  c+i = y;                                                                               % restrição orçamentária
  y = (k(-1)^theta)*(exp(z)*h)^(1-theta);                                                % função de produção
  i = k-(1-delta)*k(-1);                                                                 % equação de movimento do capital
  r = theta*y/k;                                                                         % taxa de juros
  z = rho*z(-1)+e;                                                                       % processo estocástico da produtividade
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
