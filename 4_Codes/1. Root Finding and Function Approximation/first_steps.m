% Generate an AR (1) process

% Parameters
n = 100; % Sample size
theta = 0.8; % Persistent parameter


% Random shocks
u = randn(n,1);

% Initial values
y = zeros (n,1);

% Create series
for t = 2: n
y(t) = theta * y(t-1) + u(t);
end





