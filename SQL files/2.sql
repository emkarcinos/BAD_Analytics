--USE dbad_flights
--GO

SELECT CAST(MAX(arr_delay)/60 AS NUMERIC(30,3)) AS 'Max delay (hours)'
FROM Flight_delays
WHERE arr_delay IS NOT NULL;