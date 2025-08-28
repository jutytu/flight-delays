-- Schema for the database

-- Airlines
CREATE TABLE airlines (
    carrier CHAR(2) PRIMARY KEY, -- carrier code
    name TEXT
);

-- Airports 
CREATE TABLE airports (
    iata CHAR(3) PRIMARY KEY,  -- airport IATA code
    airport TEXT,
    city TEXT,
    state CHAR(2),
    country TEXT,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION
);

-- Flights
CREATE TABLE flights (
    year INT,
    month INT,
    day INT,
    day_of_week INT,
    airline CHAR(2),
    flight_number INT,
    tail_number VARCHAR(10),
    origin_airport TEXT,
    destination_airport TEXT,
    scheduled_departure INT,   -- in HHMM format
    departure_time INT,
    departure_delay DOUBLE PRECISION,
    taxi_out DOUBLE PRECISION,
    wheels_off INT,
    scheduled_time DOUBLE PRECISION,
    elapsed_time DOUBLE PRECISION,
    air_time DOUBLE PRECISION,
    distance DOUBLE PRECISION,
    wheels_on INT,
    taxi_in DOUBLE PRECISION,
    scheduled_arrival INT,
    arrival_time INT,
    arrival_delay DOUBLE PRECISION,
    diverted INT,
    cancelled INT,
    cancellation_reason TEXT,
    air_system_delay DOUBLE PRECISION,
    security_delay DOUBLE PRECISION,
    airline_delay DOUBLE PRECISION,
    late_aircraft_delay DOUBLE PRECISION,
    weather_delay DOUBLE PRECISION
);


