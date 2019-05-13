SELECT MAX(arr_delay)/60
FROM Flight_delays
WHERE arr_delay IS NOT NULL;