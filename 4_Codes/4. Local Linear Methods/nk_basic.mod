// =============================================================
// Basic NK model (linearized): IS + NKPC + Taylor rule
// Variables are deviations from SS (lowercase: output gap x, inflation pi, rate i)
// =============================================================

var x pi i;           // output gap, inflation, nominal interest rate (deviations)
varexo ex;            // demand shock in IS curve
parameters beta kappa sigma rhoi phi_pi phi_x rho_x;

// ---- Calibration ----
beta   = 0.99;        // discount
sigma  = 1.0;         // 1/IES
kappa  = 0.1;         // NKPC slope
rhoi   = 0.7;         // interest-rate smoothing
phi_pi = 1.5;         // Taylor coefficient on inflation (try 0.8 for indeterminacy)
phi_x  = 0.0;         // (set >0 if you want output-gap feedback)
rho_x  = 0.50;        // AR(1) demand shock

model(linear);
  // IS curve: x_t = E_t x_{t+1} - (1/sigma)( i_t - E_t pi_{t+1} ) + eps^x_t
  x = x(+1) - (1/sigma)*( i - pi(+1) ) + ex;

  // NK Phillips Curve: pi_t = beta E_t pi_{t+1} + kappa x_t
  pi = beta*pi(+1) + kappa*x;

  // Taylor rule with inertia: i_t = rhoi i_{t-1} + (1-rhoi)( phi_pi pi_t + phi_x x_t )
  i = rhoi*i(-1) + (1-rhoi)*( phi_pi*pi + phi_x*x );
end;

initval; x=0; pi=0; i=0; end;

shocks;
  // AR(1) demand shock: ex_t = rho_x ex_{t-1} + eps_t
  var ex; stderr 0.10;
end;

steady; check;

// ----------------- Classroom toggles -----------------
// (A) Determinacy:   phi_pi = 1.5;  -> unique solution (BK holds)
// (B) Indeterminacy: phi_pi = 0.8;  -> many solutions (BK fails)
//
// You can change and re-run to show the switch in eigenvalue count.
// -----------------------------------------------------

stoch_simul(order=1, irf=20, graph);
