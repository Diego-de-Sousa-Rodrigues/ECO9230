// =============================================================
// Stochastic Growth Model (log utility) — linearized
// =============================================================

var y c k z;          // output, consumption, capital, technology (all deviations)
varexo e;             // TFP shock
parameters alpha beta rhoz;

alpha = 0.33;         // capital share
beta  = 0.99;         // discount
rhoz  = 0.95;         // TFP persistence

model(linear);
  // --- Steady-state shares (from slides): y/k = 1/(alpha*beta), c/k = 1/(alpha*beta)-1 ---
  #s_y = 1/(alpha*beta);
  #s_c = s_y - 1;

  // --- Linearized equilibrium conditions (Friday's set) ---
  // Production: y_t = alpha k_{t-1} + z_t
  y = alpha*k(-1) + z;

  // Resource constraint with shares: k_t = (y/k)*y_t - (c/k)*c_t
  k = s_y*y - s_c*c;

  // Euler with log utility: ĉ_t = E_t ĉ_{t+1} - rho*z_t + (1-alpha) k̂_t
  // (equivalently: -λ̂_t = -E_t λ̂_{t+1} + rho z_t - (1-alpha) k̂_t)
  c = c(+1) - rhoz*z + (1-alpha)*k;

  // Technology AR(1)
  z = rhoz*z(-1) + e;
end;

initval; y=0; c=0; k=0; z=0; end;
shocks; var e; stderr 0.01; end;

steady; check;
stoch_simul(order=1, irf=20, graph);   // quick IRFs (20 periods)
