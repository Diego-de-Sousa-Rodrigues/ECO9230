var c k y invest;
predetermined_variables k;
parameters s alpha delta n g;

s=0.2;
alpha=0.3;
delta=0.1;
n=0.01;
g=0.02;
g_initial=0.02;

model;
(1+n+g+n*g)*k(+1)=(1-delta)*k+invest;
invest+c=y;
c=(1-s)*y;
y=k^alpha;
end;

initval;
k=0.9*((delta+n+g+n*g)/s)^(1/(alpha-1));
y=k^alpha;
c=(1-s)*y;
invest=y-c;
end;

endval;
k=((delta+n+g+n*g)/s)^(1/(alpha-1));
y=k^alpha;
c=(1-s)*y;
invest=y-c;
end;
resid(1);
steady;

simul(periods=200);
rplot k;