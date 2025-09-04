# Flight delays and cancellations (2015) 

This project analyzes US flight delays and cancellations in 2015 using PostgreSQL for data exploration and Tableau for visualization.  
The dataset comes from [Kaggle’s 2015 Flight Delays and Cancellations dataset](https://www.kaggle.com/datasets/usdot/flight-delays).  

Final Tableau Dashboard: [link](https://public.tableau.com/views/flights_17569375980110/Dashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  


## 📂 Repository Structure

```bash
flight-delays-sql-tableau/
│
├── sql/
│ ├── create_tables.sql # table schema
│ ├── load_data.sql # load CSV files into the database
│ ├── cleaning.sql # data type conversions and parsing time
│ └── analysis.sql # queries for Tableau
│
├── tableau/
│ └── dashboard.twb # packaged Tableau workbook 
│
└── README.md
```


## Steps to reproduce

1. Download dataset from Kaggle: [Flight Delays 2015](https://www.kaggle.com/datasets/usdot/flight-delays)  
2. Create a local PostgreSQL database named and run scripts in `/sql` in this order:  
   - `create_tables.sql`  
   - `load_data.sql`  
   - `cleaning.sql`  
   - `analysis.sql`  
4. Connect database to Tableau.  
5. Rebuild dashboard (`.twb` file).  


## Key insights

- Delta Air Lines Inc. had the best on-time performance (71%).  
- Busiest airport was Hartsfield-Jackson Atlanta International Airport, with the total number of 346 836 departures over the year.  
- Flight delays decreased significantly in September and October, most of the arrivals being slightly earlier than scheduled. This may reflect seasonal patterns: less severe weather or reduced travel demand after summer. 
- Most delays were due to weather or were airline's/carrier's fault.  
