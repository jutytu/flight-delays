-- Cleaning

-- Converting time from "HHMM" integer to proper time format, saving as separate columns
ALTER TABLE flights
    ADD COLUMN dep_time_parsed TIME,
    ADD COLUMN arr_time_parsed TIME,
    ADD COLUMN sched_dep_time_parsed TIME,
    ADD COLUMN sched_arr_time_parsed TIME;

UPDATE flights
SET dep_time_parsed = MAKE_INTERVAL(hours => departure_time/100, mins => departure_time%100)::TIME,
    arr_time_parsed = MAKE_INTERVAL(hours => arrival_time/100, mins => arrival_time%100)::TIME,
    sched_dep_time_parsed = MAKE_INTERVAL(hours => scheduled_departure/100, mins => scheduled_departure%100)::TIME,
    sched_arr_time_parsed = MAKE_INTERVAL(hours => scheduled_arrival/100, mins => scheduled_arrival%100)::TIME
WHERE departure_time IS NOT NULL OR arrival_time IS NOT NULL;


-- Replacing null departure_delay/arrival_delay with 0 for non-cancelled flights
UPDATE flights
SET departure_delay = 0
WHERE departure_delay IS NULL AND cancelled = 0;

UPDATE flights
SET arrival_delay = 0
WHERE arrival_delay IS NULL AND cancelled = 0;



