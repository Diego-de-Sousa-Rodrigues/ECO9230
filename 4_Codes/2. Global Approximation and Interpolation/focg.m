function f = focg(z,p)
% focg.m  Euler equations for growth model (for fsolve)
T=p(1); A=p(2); alpha=p(3); delta=p(4);
eta=p(5); k0=p(6); beta=p(7); kss=p(8);

% unpack path for k and append terminal k_{T+1}=kss
k       = zeros(T+1,1);
k(1:T)  = z(:);
k(T+1)  = kss;

% Euler conditions (t=1 and t=2..T)
f    = zeros(T,1);
f(1) = beta*(A*k(1)^alpha+(1-delta)*k(1)-k(2))^(-eta) ...
       *(alpha*A*k(1)^(alpha-1)+(1-delta)) ...
       -(A*k0^alpha+(1-delta)*k0-k(1))^(-eta);
for t=2:T
  f(t)= beta*(A*k(t)^alpha+(1-delta)*k(t)-k(t+1))^(-eta) ...
       *(alpha*A*k(t)^(alpha-1)+(1-delta)) ...
       -(A*k(t-1)^alpha+(1-delta)*k(t-1)-k(t))^(-eta);
end
