--USE dbad_flights
--GO

SELECT CAST(AVG(arr_delay) AS NUMERIC(30,3)) AS 'Average delay (minutes)'
FROM Flight_delays
WHERE arr_delay IS NOT NULL;