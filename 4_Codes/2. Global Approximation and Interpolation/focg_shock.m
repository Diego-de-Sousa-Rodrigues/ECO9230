function f = focg_shock(z,p)
% focg_shock.m  Euler equations for growth model with a temporary TFP shock
% p = [T, A, alpha, delta, eta, k0, beta, kss, s, dur, t0]
T     = p(1);    A     = p(2);    alpha = p(3);  delta = p(4);
eta   = p(5);    k0    = p(6);    beta  = p(7);  kss   = p(8);
s     = p(9);    dur   = p(10);   t0    = p(11);    % shock starts at t0, lasts 'dur'

% unpack path for k and append terminal k_{T+1}=kss
k       = zeros(T+1,1);
k(1:T)  = z(:);
k(T+1)  = kss;

% helper for time-varying A_t
shock_on = @(t) (t >= t0) && (t < t0 + dur);

% Euler conditions (t = 1 and t = 2..T)
f    = zeros(T,1);

% t = 1
A1   = A * (1 + s * shock_on(1));
A2   = A * (1 + s * shock_on(2));
f(1) = beta*(A2*k(1)^alpha + (1-delta)*k(1) - k(2))^(-eta) ...
         *(alpha*A2*k(1)^(alpha-1) + (1-delta)) ...
       - (A1*k0^alpha + (1-delta)*k0 - k(1))^(-eta);

% t = 2..T
for t = 2:T
    At   = A * (1 + s * shock_on(t));
    At1  = A * (1 + s * shock_on(t+1));
    f(t) = beta*(At1*k(t)^alpha + (1-delta)*k(t) - k(t+1))^(-eta) ...
             *(alpha*At1*k(t)^(alpha-1) + (1-delta)) ...
           - (At*k(t-1)^alpha + (1-delta)*k(t-1) - k(t))^(-eta);
end
end

