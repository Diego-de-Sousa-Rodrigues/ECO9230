# Deterministic and Stochastic RBC Models — ECO9230

This folder contains a set of Dynare `.mod` files used to illustrate the difference between **deterministic** and **stochastic** versions of the Real Business Cycle (RBC) model with monopolistic competition.

All models share the same basic structure:
- Households maximize utility over consumption and leisure.
- Firms operate a Cobb–Douglas production function.
- Capital accumulates over time.
- Productivity shocks drive economic fluctuations.

The main difference is how shocks are treated:
- Deterministic models: agents have perfect foresight and know the future path of shocks exactly.
- Stochastic models: agents only know the probability distribution of shocks.

---

## Common Equations

All models are based on the following system:

1. Euler equation:  
   (1/c) = β * (1/c(+1)) * (1 + r(+1) - δ)

2. Labor–leisure tradeoff:  
   ψ * c / (1 - l) = w

3. Resource constraint:  
   c + i = y

4. Production function:  
   y = (k(-1)^α) * (exp(z) * l)^(1 - α)

5. Factor prices:  
   w = y * ((ε - 1)/ε) * (1 - α) / l  
   r = y * ((ε - 1)/ε) * α / k(-1)

6. Capital accumulation:  
   i = k - (1 - δ) * k(-1)

7. Output per labor:  
   y_l = y / l

---

## RBCMonopDet.mod — Deterministic with Temporary Shock

**Description:**  
A deterministic RBC model with a temporary productivity shock lasting for 9 periods.  
Agents have perfect foresight and know the shock path in advance.

**Shock block:**  
shocks;
var z;
periods 1:9;
values 0.1;
end;


**Interpretation:**  
The shock temporarily raises productivity. Output, consumption, and investment increase, and the economy gradually returns to its steady state after the shock ends.

---

## RBCMonopDet1.mod — Deterministic with Permanent Shock

**Description:**  
A deterministic RBC model with a permanent increase in productivity.  
Agents have perfect foresight and know the shock is permanent.

**Implementation:**  
endval;
z = 0.1;
end;


**Interpretation:**  
The productivity level permanently rises, leading to a new, higher steady state for output, consumption, and capital.

---

## RBCMonopDet2.mod — Deterministic with Anticipated Shock

**Description:**  
A deterministic RBC model with an anticipated shock that will occur in the future (for example, in period 10).  
Agents know in advance when the shock will occur.

**Shock block:**  
shocks;
var z;
periods 1:9;
values 0;
end;


**Interpretation:**  
Even before the shock occurs, agents adjust their decisions. Investment rises in anticipation of higher future productivity, leading to smoother adjustment once the shock hits.

---

## RBCMonopJFV.mod — Stochastic Model (Monopolistic Competition)

**Description:**  
A stochastic version of the RBC model with monopolistic competition.  
Agents face random shocks instead of deterministic ones.

**Shock process:**  
z = ρ * z(-1) + e  
where e is a normally distributed innovation with variance σ².

**Interpretation:**  
Shocks are unexpected but transitory.  
This model captures business-cycle fluctuations around the steady state.  
Impulse response functions show the effects of a one-time productivity shock on output, consumption, investment, and labor.

---

## RBCStoch.mod — Baseline Stochastic Model

**Description:**  
A simpler stochastic RBC model, used as a baseline case.

**Shock process:**  
z = ρ * z(-1) + e

**Interpretation:**  
The model generates standard business-cycle dynamics.  
A positive productivity shock increases output, investment, and consumption temporarily.  
Over time, capital and labor gradually return to their steady-state levels.

---

## Running the Models

1. Open MATLAB or Octave with Dynare installed.  
2. Navigate to this folder:
3. Run a file, for example:
4. Deterministic models (`RBCMonopDet`, `RBCMonopDet1`, `RBCMonopDet2`) use:
5. Stochastic models (`RBCMonopJFV`, `RBCStoch`) use:

---

## Comparison Summary

| Model | Shock Type | Information | Persistence | Main Use |
|--------|-------------|--------------|--------------|-----------|
| RBCMonopDet | Temporary | Perfect foresight | 9 periods | Return to steady state |
| RBCMonopDet1 | Permanent | Perfect foresight | Permanent | New steady state |
| RBCMonopDet2 | Anticipated | Perfect foresight | Known future shock | Role of expectations |
| RBCMonopJFV | Random | Stochastic | Persistent (ρ = 0.95) | Business cycle analysis |
| RBCStoch | Random | Stochastic | Persistent (ρ = 0.95) | Baseline stochastic RBC |

---

## Citation

Prepared for **ECO9230 – Topics in Macroeconomics**  
Université du Québec à Montréal (UQAM)

**Author:** Diego de Sousa Rodrigues

