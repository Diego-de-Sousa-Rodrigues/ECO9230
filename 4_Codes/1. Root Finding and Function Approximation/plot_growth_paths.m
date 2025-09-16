% plot_growth_paths.m
% Quick plots for k_t, c_t, y_t, i_t after running growth.m
% The we can plot the trajectory of growth of k, y, i and c
figure 
subplot(2,2,1)
plot(c)
title('Consumption')
subplot(2,2,2)
plot(k)
title('Capital Stock')
subplot(2,2,3)
plot(y)
title('Output')
subplot(2,2,4)
plot(i)
title('Investment')



% This is to verify that the capital converges 
t = 0:(numel(k)-2);  % time for c,y,i (length T+1 for k)

figure;
subplot(3,1,1); plot(0:numel(k)-1, k, '-o'); grid on;
title('Capital k_t'); xlabel('t'); ylabel('k');

subplot(3,1,2); plot(t, [y(1:end-1), c, i]); grid on;
title('Output/Consumption/Investment'); xlabel('t');
legend('y_t','c_t','i_t','Location','best');

subplot(3,1,3); plot(t, abs(diff(k))); grid on;
title('|k_{t+1} - k_t| (convergence)'); xlabel('t'); ylabel('abs diff');


% Percent deviations from the steady state (run after growth.m)

t = 0:(numel(c)-1);        % time for y, c, i
k_aligned = k(1:end-1);    % align k with y,c,i for plotting

% Steady-state values
y_ss = A * kss^alpha;
i_ss = delta * kss;
c_ss = y_ss - i_ss;

% Percent deviations
py = 100*((y(1:end-1)/y_ss) - 1);
pc = 100*((c/c_ss)          - 1);
pi = 100*((i/i_ss)          - 1);
pk = 100*((k_aligned/kss)   - 1);

figure('Name','Percent deviations from steady state','Color','w');

subplot(4,1,1);
plot(t, py, 'LineWidth',1.5); yline(0,'k-'); grid on; axis tight;
title('Output: % deviation from y_{ss}');
xlabel('t'); ylabel('%');

subplot(4,1,2);
plot(t, pc, 'LineWidth',1.5); yline(0,'k-'); grid on; axis tight;
title('Consumption: % deviation from c_{ss}');
xlabel('t'); ylabel('%');

subplot(4,1,3);
plot(t, pi, 'LineWidth',1.5); yline(0,'k-'); grid on; axis tight;
title('Investment: % deviation from i_{ss}');
xlabel('t'); ylabel('%');

subplot(4,1,4);
plot(t, pk, 'LineWidth',1.5); yline(0,'k-'); grid on; axis tight;
title('Capital: % deviation from k_{ss}');
xlabel('t'); ylabel('%');
