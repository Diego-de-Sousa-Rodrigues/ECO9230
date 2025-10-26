// This program replicates figure 11.3.1 from chapter 11 of RMT2 by Ljungqvist and Sargent
// This is a commented version of the program given in the handout.

// Note: y_ records the simulated endogenous variables in alphabetical order
// ys0_ records the initial steady state
// ys_ records the terminal steady state
// We check that these line up at the end points
// Note: y_ has ys0_ in first column, ys_ in last column, explaining why it is 102 long; 
// The sample of size 100 is in between.

// Warning:  we align c, k, and the taxes to exploit the dynare syntax. See comments below. 
// So k in the program corresponds to k_{t+1} and the same timing holds for the taxes.

//Declares the endogenous variables;
var c k rq wq Rbig sq qt ;
//declares the exogenous variables // investment tax credit, consumption tax, capital tax, government spending
varexo taui tauc tauk g; 

parameters bet gam del alpha A;

bet=.95;  // discount factor
gam=2;    // CRRA parameter
del=.2;  //  depreciation rate
alpha=.33; //  capital's share
A=1;    // productivity

// Alignment convention:
// g tauc taui tauk are now columns of ex_. Because of a bad design decision
// the date of ex_(1,:) doesn't necessarily match the date in y_. Whether they match depends
// on the number of lag periods in endogenous versus exogenous variables.
// In this example they match because tauc(-1) and taui(-1) enter the model.

// These decisions and the timing conventions mean that 
// y_(:,1) records the initial steady state, while y_(:,102) records the terminal steady state values.
// For j > 2, y_(:,j) records [c(j-1) .. k(j-1) ..   G(j-1)]  where k(j-1) means 
// end of period capital in period j-1, which equals k(j) in chapter 11 notation.
// Note that the jump in G occurs in y_(;,11), which confirms this timing.  
// the jump occurs now in ex_(11,1)

model;
k=A*k(-1)^alpha+(1-del)*k(-1)-c-g;
c^(-gam)= bet*(c(+1)^(-gam))*((1+tauc(-1))/(1+tauc))*((1-taui)*(1-del)/(1-taui(-1))+
 ((1-tauk)/(1-taui(-1)))*alpha*A*k(-1)^(alpha-1));
rq=alpha*A*k^(alpha-1);
wq=A*k^alpha-k*alpha*A*k^(alpha-1);
Rbig = ((1+tauc(-1))/(1+tauc))*((1-taui)*(1-del)/(1-taui(-1))+((1-tauk)/(1-taui(-1)))*alpha*A*k(-1)^(alpha-1));
sq= (1-tauk)*alpha*A*k^(alpha-1) + (1-del);
qt = bet*c^(-gam)/(1+tauc);
end;

initval;
k=1.5;
c=0.6;
g = 0.2;
tauc = 0;
taui = 0;
tauk = 0;
end;
steady; // put this in if you want to start from the initial steady state, comment it out to start from the indicated values

endval; // The following values determine the new steady state after the shocks.
k=1.5;
c=0.4;
g =.4;
tauc =0;
taui =0;
tauk =0;
end;

steady; // We use steady again and the enval provided are initial guesses for dynare to compute the ss.

//  The following lines produce a g sequence with a once and for all jump in g
shocks;
// we use shocks to undo that for the first 9 periods and leave g at
// it's initial value of 0

var g;
periods 1:9;
values 0.2;
end;


// now solve the model
simul(periods=100);

figure
subplot(3,3,1)
plot(k)
title('k')
subplot(3,3,2)
plot(c)
title('c')
subplot(3,3,3)
plot(Rbig)
title('R')
subplot(3,3,4)
plot(wq)
title('w/q')
subplot(3,3,5)
plot(sq)
title('s/q')
subplot(3,3,6)
plot(rq)
title('r/q')
subplot(3,3,7)
plot(qt)
title('q')



