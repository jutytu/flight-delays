# ✈️ Flight Delays & Cancellations (2015) — SQL + Tableau

This portfolio project analyzes US flight delays and cancellations in 2015 using **PostgreSQL** for data exploration and **Tableau** for visualization.  
The dataset comes from [Kaggle’s 2015 Flight Delays and Cancellations dataset](https://www.kaggle.com/datasets/usdot/flight-delays).  

👉 Final Tableau Dashboard: [link to be added]  

---

```bash
## 📂 Repository Structure

flight-delays-sql-tableau/
│
├── data/ # CSV files (not included, see Kaggle link)
│ ├── airlines.csv
│ ├── airports.csv
│ └── flights_sample.csv
│
├── sql/
│ ├── create_tables.sql # Table schema for PostgreSQL
│ ├── load_data.sql # Load CSV files into the database
│ ├── cleaning.sql # Data type conversions & parsing (times, dates)
│ └── analysis.sql # Analytical queries for Tableau
│
├── tableau/
│ └── dashboard.twbx # Packaged Tableau workbook (exported)
│
└── README.md

```

---

## ⚙️ Steps to Reproduce

1. **Download dataset** from Kaggle: [Flight Delays 2015](https://www.kaggle.com/datasets/usdot/flight-delays)  
2. Create a local PostgreSQL database named `Flights`.  
3. Run scripts in `/sql` in this order:  
   - `create_tables.sql`  
   - `load_data.sql`  
   - `cleaning.sql`  
   - `analysis.sql`  
4. Connect PostgreSQL database to Tableau.  
5. Rebuild dashboard (or open the included `.twbx` file).  

---

## 📊 Tableau Dashboard — Visualizations

The dashboard includes:  

1. **Top 10 Busiest Airports (Map)**  
   - [Insert airports + numbers once ready]  

2. **On-Time % by Airline (Bar Chart)**  
   - [Insert best/worst airline here with %]  

3. **Average Delay by Month (Line Chart)**  
   - Delays peaked in **[Month]** at ~**[X minutes]**.  

4. **Flights by Day of Week vs Hour (Heatmap)**  
   - Most flights depart on **[Day]** around **[Hour]**.  

5. **Cancellation Reasons Breakdown (Donut Chart)**  
   - Top reason: **[Reason]**, accounting for **[X%]** of cancellations.  

---

## 🔑 Key Insights

- Airline **[X]** had the best on-time performance (**[Y]%**).  
- Airport **[Z]** experienced the longest delays, averaging **[N] minutes**.  
- Flight delays increased significantly in **[Month(s)]**.  
- Most delays were due to **[Reason 1]** and **[Reason 2]**.  

---

## 🛠️ Tech Stack

- **PostgreSQL** (SQL: schema design, cleaning, analysis)  
- **Tableau** (visualizations, interactive dashboard)  
- **GitHub** (documentation & reproducibility)  

---

## 📌 Notes

- The `/data` folder is not included due to Kaggle’s license.  
- Please download the dataset manually if you want to reproduce the project.  

---
