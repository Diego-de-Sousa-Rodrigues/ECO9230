% This program solves the Growth Model 
% The variables k and c represents respectively the capital and consumption per effective labor.
% The variable h represents the number of hours per labor.

% PARAMETER (MODEL) VALUES
alpha=0.40;
beta=0.96;
delta=0.10;
gamma=0.02;
theta=1;
eta = 0.02; 
tauc=0.17;
tauh=0.27;
tauk=0.15;

% Parameter of the program(secant.m)
maxit = 1000;
crit = 1e-3;

% Initial Capital Stock and Steady-State
u = ((beta.*(1-tauk).*alpha)./((1+gamma)-beta.*(1-delta))).^(1/(1-alpha));
lambda = 1/u;
Delta = delta +  gamma + eta + eta.*gamma;

kss = ((1-alpha).*(1-tauh).*(lambda.^(-alpha)))./(theta.*(lambda.^(1-alpha)).*(1-tauh.*(1-alpha) - tauk.*alpha) - theta.*Delta + (1-alpha).*(1-tauh).*(lambda.^(1-alpha)));
k0 = 0.8*kss;
hss = lambda.*kss;
h0 = 0.8*hss;
css = (((kss.^(alpha)).*(hss.^(1-alpha)).*(1-tauh.*(1-alpha) - tauk.*alpha)) - kss.*Delta)./(1+tauc);
c0 = 0.8*css;
gss = tauc.*css + tauh.*(1-alpha).*(kss.^(alpha)).*(hss.^(1-alpha)) + tauk.*(alpha).*(kss.^(alpha)).*(hss.^(1-alpha));
g0 = 0.8*gss;
T= 30;

% SEED 
for j=1:T;
a0(j)=k0*(1-j/T)+j/T*kss;
end
a0=a0';

for j=1:T;
b0(j)=h0*(1-j/T)+j/T*hss;
end
b0=b0';

for j=1:T;
c0(j)=g0*(1-j/T)+j/T*gss;
end
c0=c0';

x0 =[a0 b0 c0];

%Param
param = [T alpha beta delta gamma theta eta tauc tauh tauk k0 kss h0 hss g0 gss]';
options=optimoptions('fsolve','Display','iter');
sol=fsolve(@(z)foc_2(z,param),x0,options);