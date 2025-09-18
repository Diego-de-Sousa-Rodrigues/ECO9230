% growthsolve.m  Solve basic growth model with fsolve (with a temporary TFP shock)
clear; clc;

% --- Parameters ---
A=1; alpha=0.4; delta=0.06; eta=0.99; beta=0.96;  T=100;
kss = ((A*beta*alpha)/(1-(1-delta)*beta))^(1/(1-alpha));
k0  = 0.10*kss;

% --- Shock settings (edit in class) ---
s   = -0.10;    % shock size (e.g., -0.10 = -10% TFP)
dur = 30;        % duration in periods
t0  = 1;        % start period (1 = first Euler equation period)

% --- Seed (smooth line from k0 to kss) ---
x0 = zeros(T,1);
for j=1:T
  x0(j) = k0*(1-j/T) + (j/T)*kss;
end

% --- Solve with fsolve (Powell hybrid) ---
param   = [T A alpha delta eta k0 beta kss s dur t0]';
options = optimoptions('fsolve','Display','iter');
sol     = fsolve(@(z)focg_shock(z,param), x0, options);

% ---------- Build series ----------
k = [k0; sol; kss];                 % length T+2 (t = 0..T+1)
y = zeros(T+1,1);                   % t = 0..T (align with c,i below)
i = zeros(T,1);
c = zeros(T,1);

shock_on = @(t) (t >= t0) && (t < t0 + dur);
for t = 1:T
    At  = A * (1 + s * shock_on(t));
    y(t)= At * k(t)^alpha;
    i(t)= k(t+1) - (1-delta)*k(t);
    c(t)= y(t) - i(t);
end
y(T+1) = A * k(T+1)^alpha;          % terminal y (no c,i needed)

% ---------- Simple plots (robust sizes) ----------
t_k = (0:numel(k)-1).';             % for k
t   = (0:numel(c)-1).';             % for y,c,i
y_aligned = y(1:end-1);             % align y with c,i

figure('Name','Shock: Levels','Color','w');
subplot(2,2,1); plot(t_k,k,'-'); grid on; title('k_t'); xlabel t; ylabel k
subplot(2,2,2); plot(t,y_aligned,'-'); grid on; title('y_t'); xlabel t; ylabel y
subplot(2,2,3); plot(t,c,'-'); grid on; title('c_t'); xlabel t; ylabel c
subplot(2,2,4); plot(t,i,'-'); grid on; title('i_t'); xlabel t; ylabel i

% ---------- Percent deviations from steady state ----------
y_ss = A*kss^alpha; i_ss = delta*kss; c_ss = y_ss - i_ss;
py = 100*((y_aligned/y_ss)-1);
pc = 100*((c/c_ss)-1);
pi = 100*((i/i_ss)-1);
pk = 100*((k/kss)-1);

figure('Name','Shock: Percent deviations','Color','w');
subplot(4,1,1); plot(t,py,'LineWidth',1.3); yline(0); grid on; title('y (%)')
subplot(4,1,2); plot(t,pc,'LineWidth',1.3); yline(0); grid on; title('c (%)')
subplot(4,1,3); plot(t,pi,'LineWidth',1.3); yline(0); grid on; title('i (%)')
subplot(4,1,4); plot(t_k,pk,'LineWidth',1.3); yline(0); grid on; title('k (%)'); xlabel t
