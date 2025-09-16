% growth.m  Solve the finite-horizon shooting problem with Secant
clear; clc;

% --- Model parameters
A     = 10;
alpha = 0.36;
delta = 0.06;
eta   = 0.99;
beta  = 0.96;

% --- Horizon and steady state
kss = ((A*beta*alpha) / (1 - (1-delta)*beta))^(1/(1-alpha));
T   = 30;

% --- Initial capital and seed for path (k_1,...,k_T)
k0 = 0.8*kss;
x0 = [k0; k0*ones(T-1,1)];   % simple seed near kss

% --- Solver setup
maxit = 1000;
crit  = 1e-6;

% --- Pack parameters and call secant (requires secant.m and foc.m on path)
param = [A alpha delta eta beta T k0 kss];
sol   = secant('foc', x0, param, crit, maxit);

% --- Recover full paths
k = [k0; sol; kss];
y = A*k.^alpha;
i = k(2:end) - (1-delta)*k(1:end-1);
c = y(1:end-1) - i;

% --- Report
fprintf('Converged: k0=%.4f, kss=%.4f, k_T=%.4f\n', k0, kss, k(end-1));
fprintf('Min/Max c: [%.4f, %.4f]\n', min(c), max(c));
