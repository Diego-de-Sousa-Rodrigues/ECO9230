// RBC Model Chapter 2 - Understanding DSGE Models (Class Version)
// This version adds G_t (government spending) and makes it easy to change rhoa and phi.

var Y I C R K W L A G;      // added G
varexo e eG;                // added eG (gov shock)
parameters sigma phi alpha beta delta rhoa rhoG;

// ---- Parameters ----
sigma = 2;
phi   = 1.5;        // Try: 0.5 (more elastic), 5 (less elastic)
alpha = 0.35;
beta  = 0.985;
delta = 0.025;
rhoa  = 0.95;       // Try: 0.50 (low persistence) or 0.99 (high)
rhoG  = 0.90;       // persistence of government spending

model(linear);
  // ---- Steady-state auxiliaries (same structure as original) ----
  #Pss = 1;
  #Rss = Pss*((1/beta) - (1-delta));
  #Wss = (1- alpha)*(Pss^(1/(1-alpha)))*((alpha/Rss)^(alpha/(1-alpha)));
  #Yss = ((Rss/(Rss - delta*alpha))^(sigma/(sigma + phi)))*(((1-alpha)^(-phi)*((Wss/Pss)^(1+phi)))^(1/(sigma+phi)));
  #Iss = ((delta*alpha)/Rss)*Yss;
  #Kss = alpha*(Yss/(Rss/Pss));
  #Lss = (1-alpha)*(Yss/(Wss/Pss));
  #Css = Yss - Iss;

  // Choose a steady-state share for G (e.g., 20% of output)
  #Gss = 0.20*Yss;

  // 1) Labor supply (intratemporal)
  sigma*C + phi*L = W;

  // 2) Euler equation (intertemporal)
  (sigma/beta)*(C(+1)-C) = Rss*R(+1);

  // 3) Capital accumulation
  K = (1-delta)*K(-1) + delta*I;

  // 4) Production (Cobb-Douglas, linearized)
  Y = A + alpha*K(-1) + (1-alpha)*L;

  // 5) Factor demands (linearized marginal products)
  R = Y - K(-1);
  W = Y - L;

  // 6) Resource constraint with G
  // Original: Yss*Y = Css*C + Iss*I;
  Yss*Y = Css*C + Iss*I + Gss*G;

  // 7) TFP shock
  A = rhoa*A(-1) + e;

  // 8) Government spending shock
  G = rhoG*G(-1) + eG;
end;

steady;
check;
model_diagnostics;
model_info;

shocks;
  var e;  stderr 0.01;   // TFP shock size
  var eG; stderr 0.01;   // Gov't spending shock size (try 0.02 for bigger fiscal shock)
end;

stoch_simul(order=1, irf=20);   // 20 periods of IRFs
