# Dynamic Multi-Asset Portfolio Analysis & Performance Attribution

## Overview
This project performs a full quantitative performance attribution of a multi-asset mutual fund. It evaluates whether observed alpha is statistically significant, structurally consistent, and achieved without hidden tail risk.

---

## Key Results

- Net Alpha: **8.13% (p = 0.040)**  
- Rolling Alpha: **78.9% positive periods → persistent performance**  
- Sharpe Ratio: **0.93 vs 0.27 (Nifty benchmark)**  
- GARCH Persistence: **0.935 → long volatility memory**  
- Tail Risk Reduction: **~0.72% improvement (Monte Carlo)**  
- PCA: **55% variance → genuine diversification**

---

## Methodology

### Data Processing
- NAV → log returns  
- Expense Ratio (TER) adjusted at daily level  

### Factor Modeling
- CAPM (Alpha, Beta estimation)  
- Multivariate regression (Equity, Gold, Debt)

### Time Series Modeling
- ADF test → stationarity  
- ARIMA → mean process  
- GARCH → volatility clustering  

### Model Refinement
- Ljung-Box test → detected residual autocorrelation  
- Upgraded to ARMA-GARCH  

### Risk Analysis
- Drawdown, Calmar Ratio  
- Conditional Value-at-Risk (CVaR)  
- Monte Carlo simulation (10,000 paths)

### Structural Inference
- Reverse-engineered fund allocation logic  
- Volatility-driven equity exposure  
- Tail-risk driven gold allocation  

---

## Key Insight

The fund’s alpha is not driven by stock selection, but by dynamic regime-based asset allocation. The manager effectively trades covariance structures, reducing equity exposure during high-volatility regimes and reallocating to defensive assets.

---

## Repository Structure

- data/ → raw and processed datasets
- notebooks/ → step-by-step analysis
- src/ → reusable modeling functions
- outputs/ → plots and tables
- report/ → final PDF report


---

## Limitations

- Gaussian assumption in Monte Carlo  
- Single fund (no cross-sectional validation)  
- In-sample analysis  

---

## How to Run

```bash
# Install dependencies
install.packages(c("quantmod", "rugarch", "tseries", "PerformanceAnalytics"))

# Run analysis scripts / notebooks
```

# Author

## Bedangshu Majumder
