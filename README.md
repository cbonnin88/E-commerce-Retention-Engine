# 🎯 Prophet Commerce: End-to-End Product Analytics & AI
[![Stack: dbt | BigQuery | Polars | Scikit-Learn | Streamlit](https://img.shields.io/badge/Stack-dbt%20%7C%20BQ%20%7C%20Polars%20%7C%20ML-27C7C1?style=for-the-badge)](https://github.com/)

**Prophet Commerce** is a full-stack data product designed to move beyond descriptive analytics into the realm of **Predictive Intelligence**. Using *TheLook* e-commerce dataset, I built a production-grade pipeline that transforms raw event logs into a live "Customer 360" application.

---

## 🚀 The 7-Phase Architecture

### 1. Data Engineering & Transformation (dbt + BigQuery)
Built a modular **Medallion Architecture** to handle raw e-commerce data.
* **Staging:** Cleaned raw JSON events and orders.
* **Intermediate:** Developed complex SQL logic for **User Sequencing** and purchase intervals.
* **Marts:** Materialized final business tables for **Retention** and **Daily Revenue**.
* *Key Tech:* dbt Cloud, SQL, BigQuery.



### 2. High-Performance EDA (Polars + Python)
Used **Polars** to perform deep-dive product analytics on millions of rows with 90% faster processing than Pandas.
* **Stickiness Analysis:** Calculated DAU/MAU ratios to measure product "hook" rate.
* **Feature Adoption:** Measured the penetration of specific product categories over time.

### 3. Lifecycle Analytics (Cohort Analysis)
Engineered a **Retention Heatmap** to visualize user decay.
* Identified critical drop-off points in the first 3 months of the user lifecycle.
* *Visualized with:* Plotly (Viridis Scale).



### 4. Machine Learning (Predictive Modeling)
Shifted from historical data to forecasting future behavior.
* **Churn Prediction:** Built a **BigQuery ML (Logistic Regression)** model to flag users with >60 days of inactivity.
* **LTV Forecasting:** Implemented a **Scikit-Learn Random Forest Regressor** to predict total customer lifetime value.

### 5. Experimental Design (A/B Testing)
Validated product changes using frequentist statistics.
* Simulated a category-wide UI experiment.
* Performed **Z-Tests** for proportions to determine statistical significance (p < 0.05).



### 6. Executive Dashboards (Looker Studio)
Translated complex data into a "Management View."
* Developed a "Risk Radar" dashboard with cross-filtering and real-time KPI scorecards.

### 7. Deployment (Streamlit)
Deployed a live **Customer Intelligence Tool** that allows stakeholders to lookup specific User IDs and see their predicted "Health Score" and future spend.

---

## 🎨 Color Palette & Branding
| Role | HEX | Visual |
| :--- | :--- | :--- |
| **Primary** | `#27C7C1` | ![#27C7C1](https://via.placeholder.com/15/27C7C1?text=+) |
| **Secondary** | `#6B46C1` | ![#6B46C1](https://via.placeholder.com/15/6B46C1?text=+) |
| **Background** | `#1B1F3B` | ![#1B1F3B](https://via.placeholder.com/15/1B1F3B?text=+) |

---

## 🛠️ Installation & Usage
1. **SQL:** Run dbt models using `dbt run`.
2. **Notebook:** Open the `Phase_4_EDA.ipynb` in Google Colab.
3. **App:** Run `streamlit run app.py` to launch the local server.

---

## 📈 Key Insights
* **Retention:** Users acquired via "Organic" channels had a 12% higher 3-month retention than "Search" users.
* **Monetization:** Predicted that 5% of the user base accounts for 45% of total projected LTV.

---
Created by Christopher Bonnin - [LinkedIn](https://www.linkedin.com/in/christopher-bonnin-a08a95197/)
