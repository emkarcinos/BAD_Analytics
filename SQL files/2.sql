USE dbad_flights
GO

SELECT CAST(MAX(arr_delay_new) AS NUMERIC(30,3)) AS 'Max delay (minutes)'
FROM Flight_delays
WHERE arr_delay_new IS NOT NULL;