/*
In deterministic models, the occurrence of all future shocks is known exactly at
the time of computing the model's solution.
Let's consider a shock to a model's innovation only in period 1. In a deterministic context, agents will
take their decisions knowing that future values of the innovations will be zero in all periods to come.
Why these models are useful? These models are usually introduced to study the impact of a change in
regime, as in the introduction of a new tax, for instance.
Models assume full information, perfect foresight and no uncertainty
around shocks.
Shocks can hit the economy today or at any time in the future, in which
case they would be expected with perfect foresight.
*/
/*
 * Deterministic Model with temporary shocks.
 * In this case the shocks last for 9 periods.
 * In the case of a temporary shock, for instance, the trajectory will basicaly describe how the system gets back 
 * to equilibrium after being perturbed from the shocks you entered.
 */

var y c k i l y_l w r ;
varexo z;
parameters beta psi delta alpha sigma epsilon;
alpha = 0.33;
beta = 0.99;
delta = 0.023;
psi = 1.75;
sigma = (0.007/(1-alpha));
epsilon = 10;

model;
(1/c) = beta*(1/c(+1))*(1+r(+1)-delta);
psi*c/(1-l) = w;
c+i = y;
y = (k(-1)^alpha)*(exp(z)*l)^(1-alpha);
w = y*((epsilon-1)/epsilon)*(1-alpha)/l;
r = y*((epsilon-1)/epsilon)*alpha/k(-1);
i = k-(1-delta)*k(-1);
y_l = y/l;
end;

initval;
k = 9;
c = 0.7;
l = 0.3;
w = 2.0;
r = 0;
z = 0;
end;

steady;

check;

shocks;
var z;
periods 1:9;
values 0.1;
end;

simul(periods=2100);