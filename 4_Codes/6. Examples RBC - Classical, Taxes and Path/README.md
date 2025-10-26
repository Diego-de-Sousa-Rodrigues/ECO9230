# RBC and Growth Models — ECO9230

This folder contains several **Dynare `.mod` files** used in the ECO9230 course to illustrate the structure and logic of dynamic macroeconomic models.  
The models progress from the **Solow growth model** to **RBC** and **tax reform** frameworks.

---

## 📘 1. `Solow.mod`

### Model Description
A deterministic **Solow growth model** describing the evolution of capital and output over time.

### Core Equations
\[
\begin{aligned}
(1+n+g+ng)\,k_{t+1} &= (1-\delta)\,k_t + i_t, \\
i_t + c_t &= y_t, \\
c_t &= (1-s)\,y_t, \\
y_t &= k_t^{\alpha}.
\end{aligned}
\]

### Intuition
- Output is determined by capital through a Cobb–Douglas production function.
- The saving rate \(s\) determines how much output is invested.
- The model converges deterministically to the steady state:
  \[
  k^* = \left(\frac{s}{\delta+n+g+ng}\right)^{\frac{1}{1-\alpha}}.
  \]

---

## 🧮 2. `RBC.mod`

### Model Description
A **basic Real Business Cycle (RBC)** model with optimizing households and firms, subject to stochastic productivity.

### Core Equations
\[
\begin{aligned}
\sigma C_t + \phi L_t &= W_t, && \text{(labor–leisure tradeoff)} \\
\frac{\sigma}{\beta}(C_{t+1}-C_t) &= R^{ss} R_{t+1}, && \text{(Euler equation)} \\
K_t &= (1-\delta)K_{t-1} + \delta I_t, && \text{(capital accumulation)} \\
Y_t &= A_t + \alpha K_{t-1} + (1-\alpha)L_t, && \text{(production)} \\
R_t &= Y_t - K_{t-1}, \quad W_t = Y_t - L_t, && \text{(factor prices)} \\
Y^{ss}Y_t &= C^{ss}C_t + I^{ss}I_t, && \text{(resource constraint)} \\
A_t &= \rho_A A_{t-1} + e_t. && \text{(TFP process)}
\end{aligned}
\]

### Intuition
- Productivity shocks drive cyclical fluctuations.
- Firms adjust factor demand, households smooth consumption.
- Capital builds gradually → hump-shaped IRFs for \(K\) and \(I\).

---

## 💰 3. `RBC_taxes.mod`

### Model Description
An **RBC model with capital and labor income taxation**, showing the effect of fiscal distortions.

### Core Equations
\[
\begin{aligned}
Y_t &= K_{t-1}^{\alpha}(Z_t N_t)^{1-\alpha}, \\
C_t + I_t &= Y_t, \\
K_t &= (1-\delta)K_{t-1} + I_t, \\
R_t &= \alpha (1-\tau_K)\frac{Y_t}{K_{t-1}}, \quad
W_t = (1-\alpha)(1-\tau_L)\frac{Y_t}{N_t}, \\
Z_t &= \psi Z_{t-1} + e_t.
\end{aligned}
\]

### Intuition
- Taxes lower effective returns, reducing savings and capital accumulation.
- Higher tax rates → lower \(K^*\), \(Y^*\), and \(C^*\).
- Useful for discussing long-run effects of taxation.

---

## 🕒 4. `RBC_path.mod`

### Model Description
A **deterministic transition** version of the RBC model used to show how an economy converges toward its steady state.

### Core Equations
Same as the basic RBC model, but simulated without stochastic shocks.

\[
\begin{aligned}
K_{t+1} &= (1-\delta)K_t + I_t, \\
Y_t &= K_t^{\alpha}H_t^{1-\alpha}, \\
C_t + I_t + G_t &= Y_t, \\
\text{Household FOC: } \frac{C_t}{1-H_t} &= (1-\alpha)\frac{Y_t}{H_t}.
\end{aligned}
\]

### Intuition
- Shows the **speed of convergence** after an initial deviation from steady state.
- All paths (\(K, C, Y, I, H, G\)) converge deterministically to their long-run values.

---

## ⚖️ 5. `RBC_path_tax_reform.mod`

### Model Description
A deterministic RBC model used to simulate a **permanent tax reform** reducing the capital tax rate.

### Policy Experiment
At period \(t=100\):
\[
\tau_K : 0.15 \rightarrow 0.02
\]
while labor tax \(\tau_H\) rises slightly to maintain revenue neutrality.

### Core Equations
\[
\begin{aligned}
Y_t &= K_t^{\alpha}H_t^{1-\alpha}, \\
C_t + I_t + G_t &= Y_t, \\
K_{t+1} &= (1-\delta)K_t + I_t, \\
\text{Government: } G_t &= \tau_C C_t + \tau_H (1-\alpha)Y_t + \tau_K \alpha Y_t, \\
\text{Household FOC: } \frac{C_t}{1-H_t} &= (1-\tau_H)(1-\alpha)\frac{Y_t}{H_t}.
\end{aligned}
\]

### Intuition
- A lower \(\tau_K\) increases the after-tax return on capital.
- Leads to higher investment, capital, and output.
- Consumption and government spending adjust gradually to the new steady state.

---

## ⚙️ Running the Models

1. Open MATLAB or Octave with **Dynare** installed.  
2. Navigate to this directory:
   ```bash
   cd path/to/models
