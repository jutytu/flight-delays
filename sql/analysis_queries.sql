-- Analysis queries

-- =================================
-- Query 1: Top 10 busiest airports
-- =================================
SELECT a.airport, a.city, a.state,
       COUNT(*) AS total_departures
FROM flights f
JOIN airports a ON f.origin_airport = a.iata
GROUP BY a.airport, a.city, a.state
ORDER BY total_departures DESC
LIMIT 10;


-- ============================================================================
-- Query 2: On-time performance by airline - airlines by % of on-time arrivals
-- ============================================================================
SELECT al.name AS airline,
       ROUND(100.0 * SUM(CASE WHEN f.arrival_delay <= 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS on_time_percentage
FROM flights f
JOIN airlines al ON f.airline = al.carrier
WHERE f.cancelled = 0
GROUP BY al.name
ORDER BY on_time_percentage DESC;


-- ===============================================================================
-- Query 3: Worst airports for arrival delays - airports by average arrival delay
-- ===============================================================================
SELECT airport,
       ROUND(AVG(arrival_delay)::DECIMAL, 2) AS avg_arr_delay,
       RANK() OVER (ORDER BY AVG(arrival_delay) DESC) AS delay_rank
FROM flights f
JOIN airports a ON f.destination_airport = a.iata
WHERE f.cancelled = 0 AND f.arrival_delay IS NOT NULL
GROUP BY airport
ORDER BY avg_arr_delay DESC
LIMIT 10;


-- ===============================================
-- Query 4: Flight volume by day of week and hour
-- ===============================================
WITH flight_hours AS (
    SELECT day_of_week,
           EXTRACT(HOUR FROM dep_time_parsed) AS dep_hour
    FROM flights
    WHERE dep_time_parsed IS NOT NULL
)
SELECT day_of_week, dep_hour, COUNT(*) AS flights
FROM flight_hours
GROUP BY day_of_week, dep_hour
ORDER BY flights DESC;


-- ========================================================================
-- Query 5: Cancellation reasons breakdown
-- A - Airline/Carrier; B - Weather; C - National Air System; D - Security
-- ========================================================================
SELECT cancellation_reason,
       COUNT(*) AS cancellations,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_of_total
FROM flights
WHERE cancelled = 1
GROUP BY cancellation_reason
ORDER BY cancellations DESC;


-- ====================================
-- Query 6: Longest delays per airline 
-- ====================================
SELECT airline, flight_number, origin_airport, destination_airport,
       arrival_delay,
       dep_time_parsed, arr_time_parsed
FROM (
    SELECT f.*, ROW_NUMBER() OVER (PARTITION BY airline ORDER BY arrival_delay DESC) AS rn
    FROM flights f
    WHERE f.cancelled = 0 AND f.arrival_delay IS NOT NULL
) 
WHERE rn = 1
ORDER BY arrival_delay DESC;


-- =========================================
-- Query 7: Average arrival delay per month
-- =========================================
SELECT month,
       ROUND(AVG(arrival_delay)::DECIMAL, 2) AS avg_arr_delay
FROM flights
WHERE cancelled = 0 AND arrival_delay IS NOT NULL
GROUP BY month
ORDER BY month;

