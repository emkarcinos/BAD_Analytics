--USE dbad_flights
--GO

SELECT carrier AS 'Carrier',
       origin_city_name AS 'Origin',
       dest_city_name AS 'Destination',
       fl_date AS 'Date',
       arr_delay AS 'Delay (minutes)'
FROM   Flight_delays
WHERE  arr_delay = (SELECT MAX(arr_delay)
                    FROM   Flight_delays
                    WHERE  arr_delay IS NOT NULL);