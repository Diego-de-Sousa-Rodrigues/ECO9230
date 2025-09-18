% benchmark_closed_form_vs_fsolve.m
% Compare closed-form path (eta=1, delta=1) vs numerical (fsolve + focg.m)

clear; clc;

% ----- Parameters (benchmark case) -----
A     = 1.0;
alpha = 0.40;
beta  = 0.96;
delta = 1.00;   % full depreciation
eta   = 1.00;   % log utility
T     = 80;

% Steady state under (A,alpha,beta,delta=1)
kss = (beta*alpha*A)^(1/(1-alpha));

% Start below SS to see transition
k0 = 0.10 * kss;

% ===========================
% 1) CLOSED-FORM (analytical)
% ===========================
% k_{t+1} = beta*alpha*A * k_t^alpha
k_cf = zeros(T+1,1);                 % t = 0..T (length T+1)
k_cf(1) = k0;
for t = 1:T
    k_cf(t+1) = beta*alpha*A * k_cf(t)^alpha;
end
y_cf = A * k_cf(1:end-1).^alpha;     % t = 0..T-1 (length T)
c_cf = y_cf - k_cf(2:end);           % delta=1 => c_t = y_t - k_{t+1}

% ===========================
% 2) NUMERICAL (fsolve + focg)
% ===========================
% Use focg.m with terminal k_{T+1} = kss
x0      = linspace(k0, kss, T).';          % seed toward SS
param   = [T A alpha delta eta k0 beta kss]';
options = optimoptions('fsolve','Display','iter');  % 'off' if preferred
sol     = fsolve(@(z)focg(z,param), x0, options);

% Build numerical series
k_num_full = [k0; sol; kss];               % length T+2 (t = 0..T+1)
k_num      = k_num_full(1:end-1);          % take t = 0..T (length T+1)
k_t        = k_num(1:end-1);               % t = 0..T-1 (length T)
k_next     = k_num(2:end);                 % t = 1..T   (length T)
y_num      = A * k_t.^alpha;               % length T
% General formula: c_t = y_t - (k_{t+1} - (1-delta)k_t)
% Here delta=1, so c_t = y_t - k_{t+1}
c_num      = y_num - k_next;               % length T

% ===========================
% 3) Plots: overlay CF vs fsolve
% ===========================
tK = (0:T).';                 % for k paths (length T+1)
tC = (0:T-1).';               % for c paths (length T)

figure('Name','Benchmark: k_t (closed-form vs fsolve)','Color','w');
plot(tK, k_cf, 'o-', 'LineWidth',1.4); hold on;
plot(tK, k_num, '-.', 'LineWidth',1.4); grid on; hold off;
title('Capital path k_t'); xlabel('t'); ylabel('k');
legend('Closed-form','Numerical (fsolve)','Location','best');

figure('Name','Benchmark: c_t (closed-form vs fsolve)','Color','w');
plot(tC, c_cf, 'o-', 'LineWidth',1.4); hold on;
plot(tC, c_num, '-.', 'LineWidth',1.4); grid on; hold off;
title('Consumption path c_t'); xlabel('t'); ylabel('c');
legend('Closed-form','Numerical (fsolve)','Location','best');

% Optional: report max absolute differences
maxdiff_k = max(abs(k_cf - k_num));
maxdiff_c = max(abs(c_cf - c_num));
fprintf('Max |k_cf - k_num| = %.3e\n', maxdiff_k);
fprintf('Max |c_cf - c_num| = %.3e\n', maxdiff_c);
