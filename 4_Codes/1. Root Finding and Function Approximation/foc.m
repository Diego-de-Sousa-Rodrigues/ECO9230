function f = foc(x, param)
% foc.m
% Residuals of the Euler equation for the optimal growth model
% x:     T-by-1 vector with k_1,...,k_T
% param: [A alpha delta eta beta T k0 kss]

A     = param(1);
alpha = param(2);
delta = param(3);
eta   = param(4);
beta  = param(5);
T     = param(6);
k0    = param(7);
kss   = param(8);

% Build capital path including k0 and terminal k_{T+1} = kss
k = [k0; x(:); kss];    % length T+2
f = zeros(T,1);

for t = 1:T
    kt   = k(t);
    kt1  = k(t+1);
    kt2  = k(t+2);

    % Resource constraints
    c_t  = A*kt^alpha  + (1-delta)*kt  - kt1;
    c_tp = A*kt1^alpha + (1-delta)*kt1 - kt2;

    % Euler (CRRA: u'(c) = c^(-eta))
    f(t) = - c_t^(-eta) ...
           + beta*(alpha*A*kt1^(alpha-1) + (1-delta)) * c_tp^(-eta);
end
end
