SELECT carrier,
       origin_city_name,
       dest_city_name,
       fl_date,
       arr_delay
FROM   Flight_delays
WHERE  arr_delay = (SELECT MAX(arr_delay)
                    FROM   Flight_delays
                    WHERE  arr_delay IS NOT NULL);