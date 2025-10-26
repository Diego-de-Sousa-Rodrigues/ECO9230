
// In stochastic models, instead,only the distribution of future shocks is known.

// Consider a model innovation only in period 1. In a stochastic context, agents will take their decisions
// knowing that the future value of innovations are random but will have zero
// mean. This isn't the same thing because of Jensen's inequality. The variance of the shock will matter.

// Intuitively, if an agent has perfect foresight, she can specify today - at the time of making her decision - what 
// each of her precise actions will be in the future. In a stochastic environment, instead, the best
// the agent can do is specify a decision, policy or feedback rule for the future:
// what will her optimal actions be contingent on each possible realization of
// shocks. In this case, we therefore search for a function satisfying the model's first order conditions.

// In these models, shocks hit today (with a surprise), but thereafter their
// expected value is zero. Expected future shocks, or permanent changes
// in the exogenous variables cannot be handled due to the use of Taylor
// approximations around a steady state.

// If you're dealing with a stochastic model, remember that its lin-
// ear approximation is good only in the vicinity of the steady state, thus it is
// strongly recommended that you start your simulations from a steady state;
// this means either using the command steady or entering exact steady state
// values.


var y c k i l y_l w r z;
varexo e;

parameters beta psi delta alpha rho gamma sigma epsilon;

alpha = 0.33;
beta = 0.99;
delta = 0.023;
psi = 1.75;
rho = 0.95;
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
z = rho*z(-1)+e;
end;

initval;
k = 9;
c = 0.76;
l = 0.3;
w = 2.07;
r = 0.03;
z = 0;
e = 0;
end;

steady;
check;

shocks;
var e = sigma^2;
end;

stoch_simul(periods=2100);