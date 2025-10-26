var Y K N C lambda R Z;
varexo e;

parameters A Z_bar alpha delta beta psi tau xi Psi theta;

A = 2.5846;  
Z_bar = 1; 
alpha = .36; 
delta = .025; 
beta = 1/1.01; 
psi = .95; 
tau = 0; 
xi = 0;
Psi = alpha*(1-tau) + (1-xi)*(1-alpha);
theta = (1-tau);

model(linear);
# Rss = (1/beta - (1-delta*theta))/Psi;
# YKss= Rss/alpha;
# YNss=(Z_bar*(YKss)^(-alpha))^(1/(1-alpha));
# lambdass = A/(Psi*(1-alpha)*YNss);
# CKss = Psi*YKss - delta*theta;
# Css = 1/lambdass;
# Kss=Css/(CKss);
# Yss=(YKss)*Kss;
C + lambda = 0;
lambda + Y - N = 0;
-Rss*R + alpha*(YKss)*(Y-K(-1))=0;
-Y+Z+alpha*K(-1) + (1-alpha)*N=0;
-Css*C - Kss*K + Psi*Yss*Y + (1-delta*theta)*Kss*K(-1)=0;
-lambda + lambda(+1) + beta*Psi*Rss*R(+1)=0;
Z = psi*Z(-1) + e;
end;

steady;
check;

model_diagnostics;
model_info;

shocks;
var e;
stderr 0.0712;
end;

stoch_simul;