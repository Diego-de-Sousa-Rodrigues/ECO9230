% growthsolve.m  Solve basic growth model with fsolve
clear; clc;
A=1; alpha=0.4; delta=0.06; eta=0.99;
beta=0.96;  T=100;
kss = ((A*beta*alpha)/(1-(1-delta)*beta))^(1/(1-alpha));
k0  = 0.10*kss;

% seed (linear path from k0 to kss)
x0 = zeros(T,1);
for j=1:T
  x0(j) = k0*(1-j/T) + (j/T)*kss;
end

param   = [T A alpha delta eta k0 beta kss]';
options = optimoptions('fsolve','Display','iter');
sol     = fsolve(@(z)focg(z,param), x0, options);


% --- Post-processing: build series from 'sol' and plot

% Series
k = [k0; sol; kss];               % length T+2  (t = 0..T+1)
y = A * k.^alpha;                 % length T+2
i = k(2:T+1) - (1 - delta) * k(1:T);
c = y(1:T) - i;                   % length T+1 (aligns with i)
% ---- Make sure everything is a column vector ----
k = k(:); y = y(:); c = c(:); i = i(:);

% ---- Time axes (match lengths) ----
t_k = (0:numel(k)-1).';        % for k 
t    = (0:numel(c)+1).';       % for y, 
t_c_i= (0:numel(c)-1).'

% ---- Simple graphs: one figure per variable ----

figure('Name','Capital k_t','Color','w');
plot(t_k, k, '-'); grid on; xlabel('t'); ylabel('k'); title('Capital k_t');

figure('Name','Output y_t','Color','w');
plot(t, y, '-'); grid on; xlabel('t'); ylabel('y'); title('Output y_t');

figure('Name','Consumption c_t','Color','w');
plot(t_c_i, c, '-'); grid on; xlabel('t'); ylabel('c'); title('Consumption c_t');

figure('Name','Investment i_t','Color','w');
plot(t_c_i, i, '-'); grid on; xlabel('t'); ylabel('i'); title('Investment i_t');
