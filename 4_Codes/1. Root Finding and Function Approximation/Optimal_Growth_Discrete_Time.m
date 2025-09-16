% Problem: kt goes to kss only when T goes to infinite.
% However, the speed of convergence to the steady-state value is
% usually very high in this growth model
% In practice for a given k0, we know that kt is very close to kSS,
% when, for instance, t = 30.
% Therefore, it is possible to find an approximate trajectory very
% close to the true one. The idea is to construct a vector
% k = [k0; k1; k2;...; kT+1]

% The solution of the Optimal Growth in Discrete Time is given by
% f(k2,k1,k0) = 0;
% (k3,k2,k1) = 0;
% f(kT+1,kT,kT-1) = 0;
% These are the diference equations. Notice that k0 is given and 
% kT+1 = Kss and thefore we have T equations and T unknowns variables


