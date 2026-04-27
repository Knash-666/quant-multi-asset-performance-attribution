# Dynamic Multi-Asset Portfolio Analysis & Performance Attribution

## Overview

This project performs an **end-to-end quantitative performance attribution** of a multi-asset mutual fund. The objective is to determine whether observed alpha is:

- **Statistically significant**
- **Persistent across time**
- **Achieved without hidden tail risk**

The analysis integrates **factor modeling, time-series econometrics, and simulation-based risk assessment** to isolate the true source of returns.

---

## Core Claim

The fund’s statistically significant alpha (**8.13%, p = 0.040**) is **not driven by security selection**, but by **dynamic, regime-sensitive asset allocation**.

Specifically, the manager appears to exploit **time-varying covariance structures across asset classes**, adjusting exposures in response to volatility regimes.  
This indicates **systematic exposure timing**, not idiosyncratic alpha generation.

---

## Key Results

- **Net Alpha:** 8.13% *(p = 0.040 → statistically significant at 5% level)*  
- **Rolling Alpha:** 78.9% positive periods → persistent performance  
- **Sharpe Ratio:** 0.93 vs 0.27 (Nifty benchmark)  
- **Volatility Persistence (GARCH):** 0.935 → strong clustering  
- **Tail Risk Reduction:** ~0.72% improvement (Monte Carlo simulation)  
- **Diversification (PCA):** 55% variance explained → meaningful factor spread  

---

## Sample Outputs

### Performance vs Benchmark
![Cumulative Growth](outputs/plots/cumulative_growth.png)

### Rolling Alpha (Consistency of Skill)
![Rolling Alpha](outputs/plots/rolling_alpha.png)

### Drawdown Profile
![Drawdown](outputs/plots/drawdown.png)

### Tail Risk (Monte Carlo)
![Tail Risk](outputs/plots/tail_risk.png)

---

## Methodology

### Data Processing
- NAV → log returns  
- Expense ratio (TER) adjusted at daily frequency  
- Cleaned dataset stored as `data/processed/cleaned_data.rds`

### Factor Modeling
- CAPM for baseline alpha/beta estimation  
- Multivariate regression (Equity, Gold, Debt exposures)

### Time Series Modeling
- ADF test for stationarity  
- ARMA modeling for mean dynamics  
- GARCH(1,1) for volatility clustering  

### Model Refinement
- Ljung–Box test detected residual autocorrelation  
- Model upgraded to **ARMA–GARCH framework**

### Risk Analysis
- Drawdown and Calmar ratio  
- Conditional Value-at-Risk (CVaR)  
- Monte Carlo simulation (10,000 paths)

### Structural Inference
- Reverse-engineered allocation logic  
- Evidence of **volatility-driven equity exposure**  
- Gold allocation increases during tail-risk regimes  

---

## Data Pipeline

- **Raw data acquisition & preprocessing:** `src/data_prep.R`  
- **Processed dataset:** `data/processed/cleaned_data.rds`  
- **Analysis notebook:** `notebooks/analysis.qmd`  
- **Final report:** `report/report.pdf`

---

## Model Risk & Limitations

- Results are based on **in-sample analysis** (no out-of-sample validation)  
- GARCH assumes volatility clustering but **does not capture jump risk**  
- Monte Carlo simulation assumes conditional normality → may underestimate extreme tails  
- Factor model may omit latent macro drivers (e.g., regime shifts, liquidity shocks)  
- Single-fund analysis limits generalizability  

---

## Key Insight

The fund’s performance is best explained as a **regime-adaptive allocation strategy** that dynamically reallocates across asset classes based on evolving volatility and correlation structures.

This suggests:

> The manager is trading **risk structure**, not individual securities.

---

## How to Run

```r
# Install required packages
install.packages(c("quantmod", "rugarch", "tseries", "PerformanceAnalytics"))

# Run analysis notebook
# notebooks/analysis.qmd
```

# Author 
Bedangshu Majumder
