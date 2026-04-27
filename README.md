# Dynamic Multi-Asset Portfolio Analysis & Performance Attribution

## Overview
Quantitative performance attribution of a multi-asset mutual fund to assess whether observed alpha is statistically significant, persistent across time, and achieved without hidden tail risk.

## Data
Processed dataset included in `data/processed/` (RDS format).

## Key Results
- Net Alpha: **8.13% (p = 0.040)**
- Rolling Alpha: **78.9% positive periods → persistence**
- Sharpe Ratio: **0.93 vs 0.27 (Nifty benchmark)**
- GARCH Persistence: **0.935 → long volatility memory**
- Tail Risk Reduction: **~0.72% (Monte Carlo)**
- PCA: **55% variance explained → meaningful diversification**

## Methodology
- Data Processing: NAV → log returns, TER-adjusted daily  
- Factor Modeling: CAPM + multivariate regression (Equity, Gold, Debt)  
- Time Series: ADF (stationarity), ARIMA (mean), GARCH (volatility)  
- Model Refinement: Ljung-Box → ARMA-GARCH upgrade  
- Risk Analysis: Drawdown, Calmar, CVaR, Monte Carlo (10,000 simulations)  
- Structural Inference: Reverse-engineered allocation logic (volatility-driven equity, tail-risk hedging via gold)

## Key Insight
Alpha is driven by dynamic regime-based asset allocation rather than stock selection. The fund adjusts equity exposure in response to volatility and uses gold as a defensive hedge, effectively trading covariance structures.

## Repository Structure
- `data/` → raw and processed datasets  
- `notebooks/` → analysis workflow  
- `src/` → reusable modeling functions  
- `outputs/` → plots and tables  
- `report/` → final PDF  

## Limitations
- Gaussian assumption in Monte Carlo  
- Single-fund analysis (no cross-sectional validation)  
- In-sample evaluation  

## How to Run
```bash
install.packages(c("quantmod", "rugarch", "tseries", "PerformanceAnalytics"))
```

# Author 
Bedangshu Majumder
