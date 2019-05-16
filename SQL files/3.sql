USE dbad_flights
GO

SELECT carrier AS 'Carrier',
       origin_city_name AS 'Origin',
       dest_city_name AS 'Destination',
       fl_date AS 'Date',
       arr_delay_new AS 'Delay (minutes)'
FROM   Flight_delays
WHERE  arr_delay_new = (SELECT MAX(arr_delay_new)
                    FROM   Flight_delays
                    WHERE  arr_delay_new IS NOT NULL);