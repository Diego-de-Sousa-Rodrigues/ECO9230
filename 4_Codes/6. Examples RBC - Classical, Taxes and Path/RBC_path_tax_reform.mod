// Now we are going to study a taxa reform in which we diminishe the tax in capital and increase the tax on labor
// A permanent decreasing in the tax on capital at the time 100

var k h g c y i;
varexo tauc tauh tauk;
parameters beta delta gamma alpha theta eta u lambda Delta kss hss css gss;

beta=0.96;
delta=0.1;
gamma=0.02;
alpha=0.4;
theta=1;
eta=0;
u = ((beta*alpha*(1-tauk))/((1+gamma)-beta*(1-delta)))^(1/(1-alpha));
lambda = 1/u;
Delta = delta +  gamma + eta + eta*gamma;
kss = ((1-alpha)*(1-tauh)*(lambda^(-alpha)))/(theta*(lambda^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha) - theta*Delta + (1-alpha)*(1-tauh)*(lambda^(1-alpha)));
hss = lambda*kss;
css = (((kss^(alpha))*(hss^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha)) - kss*Delta)/(1+tauc);
gss = tauc*css + tauh*(1-alpha)*(kss^(alpha))*(hss^(1-alpha)) + tauk*(alpha)*(kss^(alpha))*(hss^(1-alpha));


model(linear);
k^alpha*h^(1-alpha)+(1-delta)*k-g-(1+gamma)*(1+eta)*k(+1)-(beta/(1+gamma))*((1-tauk)*alpha*k^(alpha-1)*h^(1-alpha)+1-delta)*(k(-1)^alpha*h(-1)^(1-alpha)+(1-delta)*k(-1)-g(-1)-(1+gamma)*(1+eta)*k)=0; 
(theta*(k^alpha*h^(1-alpha)+(1-delta)*k-g-(1+gamma)*(1+eta)*k(+1)))/(1-h)-((1-tauh)/(1+tauc))*(1-alpha)*k^alpha*h^(-alpha)=0;
g-tauc*(k^alpha*h^(1-alpha)+(1-delta)*k-g-(1+gamma)*(1+eta)*k(+1))-tauh*(1-alpha)*k^alpha*h^(1-alpha)-tauk*alpha*k^(alpha)*h^(1-alpha)=0;
c = k^alpha*h^(1-alpha)+(1-delta)*k-g-(1+gamma)*(1+eta)*k(+1);
y = k^alpha*h^(1-alpha);
i = y - g -c;
end;

initval;
k = (((1-alpha)*(1-tauh)*(lambda^(-alpha)))/(theta*(lambda^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha) - theta*Delta + (1-alpha)*(1-tauh)*(lambda^(1-alpha))));
h = (lambda*k);
g = (tauc*c + tauh*(1-alpha)*(k^(alpha))*(h^(1-alpha)) + tauk*(alpha)*(k^(alpha))*(h^(1-alpha)));
c = ((((k^(alpha))*(h^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha)) - k*Delta)/(1+tauc));
y = k^alpha*h^(1-alpha);
i = y - g -c;
tauc=0.17;
tauh=0.27;
tauk=0.15;
end;

endval;
k = (((1-alpha)*(1-tauh)*(lambda^(-alpha)))/(theta*(lambda^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha) - theta*Delta + (1-alpha)*(1-tauh)*(lambda^(1-alpha))));
h = (lambda*k);
g = gss;
g = (tauc*c + tauh*(1-alpha)*(k^(alpha))*(h^(1-alpha)) + tauk*(alpha)*(k^(alpha))*(h^(1-alpha)));
c = ((((k^(alpha))*(h^(1-alpha))*(1-tauh*(1-alpha) - tauk*alpha)) - k*Delta)/(1+tauc));
y = k^alpha*h^(1-alpha);
i = y - g -c;
tauc=0.17;
tauk=0.02;
end;
resid(1);
steady;

shocks;
var tauk;
periods 1:100;
values 0.15;
end;

simul(periods=200);
figure
subplot(2,3,1)
plot(k)
title('k')
subplot(2,3,2)
plot(c)
title('c')
subplot(2,3,3)
plot(h)
title('h')
subplot(2,3,4)
plot(g)
title('g')
subplot(2,3,5)
plot(y)
title('y')
subplot(2,3,6)
plot(i)
title('i')