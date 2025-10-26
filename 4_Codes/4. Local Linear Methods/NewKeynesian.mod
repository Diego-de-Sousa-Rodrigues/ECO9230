// This program solves the basic New Keynesian Model
/*
We can see that the productivity shock leds the values of marginal product of labor and capital to increase. This 
led the firms to increase their demands for these inputs (labor and capital). The growth in demand for these inputs 
increase prices - return in capital and wages. The growth in wages, increase the income of the households. Therefore,
if, on the one hand, the increasing in the wages grow the acquisition of the goods (investment and consumption),
by the other hand, increase the demand for other good - leisure - income effect. This falls in labor supply,
explains the higher resistance of wages returning to the steady state values. We can see that the growth in capital, 
led to a decreasing in the returns in capital, that fell below to its value in the initial steady state.
We can sum up this by saying that the higher productivity increased the spending variables (investment and consumption),
and input prices. Therefore by the income effect the households increase the leisure and the wages return to its value
in the initial steady state. We can see that labor supply decrease because of the predominance of income effect. 
The difference between the New Keynesian model and the RBC model is that in the New Keynesian approach, the 
productivity shock led to a significant rise in consumption compared to the results of the RBC. In the RBC approach the 
effects of the increasig in the labor supply in the first moment is greater than the effects in the New Keynesian approach.
Therefore the productivity shock affected the product via aggregate demand in the New Keynesian approcah, while in the RBC
the productivity shock affected via aggregate supply.
We also perceive that greater price stickness caused real wages to practically double in value when compared to the RBC
approach. 
*/

var Y I C R K W L MC P PI A;
varexo e;
parameters sigma phi alpha beta delta rhoa psi theta;

sigma = 2;
phi = 1.5; 
alpha = 0.35;
beta = 0.985; 
delta = 0.025;
rhoa = 0.95;
psi = 8; 
theta = 0.75;

model(linear);
#Pss = 1;
#Rss = Pss*(1/beta -(1-delta));
#MCss = ((psi-1)/psi)*(1-beta*theta)*Pss;
#Wss = (1-alpha)*(MCss^(1/(1-alpha)))*((alpha/Rss)^(alpha/(1-alpha)));
#Yss = (Rss/(Rss - delta*alpha*MCss))^(sigma/(sigma+phi))*((Wss/Pss)*(Wss/((1-alpha)*MCss))^(phi))^(1/(sigma+phi));
#Iss = ((delta*alpha*MCss)/(Rss))*Yss;
#Css=(1/(Yss^(phi/sigma)))*((Wss/Pss)*(Wss/((1-alpha)*MCss))^(phi))^(1/(sigma));
#Lss = (1-alpha)*MCss*Yss/Wss;
#Kss=alpha*MCss*Yss/Rss;
//1 - Labor supply
sigma*C +phi*L = W - P;
//2 - Euler Equation
(sigma/beta)*(C(+1) - C)= (Rss/Pss)*(R(+1) - P(+1));
//3 - Law of motion of capital
K = (1-delta)*K(-1) + delta*I;
//4 - Production function
Y = A + alpha*K(-1) + (1-alpha)*L;
//5 - Demand for capital
K(-1) = Y - R;
//6 - Demand for labor
L = Y - W;
//7 - Marginal Cost
MC = ((1-alpha)*W + alpha*R - A);
//8 - Phillips Equation
PI = beta*PI(+1) + ((1-theta)*(1-beta*theta)/(theta))*(MC - P);
//9 - Gross Inflation rate
PI = P - P(-1);
//10 - Equilibrium condition
Yss*Y = Css*C + Iss*I;
//11 - Productivity shock
A = rhoa*A(-1) + e;
end;

steady;
check;

model_diagnostics;
model_info;

shocks;
var e;
stderr 0.01;
end;

stoch_simul;




