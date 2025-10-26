// This program replicates figure 11.3.1 from chapter 11 of RMT2 by Ljungqvist and Sargent
// A permanent increase of ?k at t=10 of 20 percent.

var c k rq wq Rbig sq qt ;
varexo taui tauc tauk g;
parameters bet gam del alpha A;
bet=.95;
gam=2;  
del=.2; 
alpha=.33; 
A=1;

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
steady;

endval; 
k=1.5;
c=0.6;
g =0.2;
tauc =0;
taui =0;
tauk = 0.2;
end;
steady; 

shocks;
var tauk;
periods 1:9;
values 0;
end;

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




