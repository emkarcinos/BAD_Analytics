--USE dbad_flights
--GO

SELECT   CASE WHEN day_of_week = 1 THEN 'Monday'
              WHEN day_of_week = 2 THEN 'Tuesday'
              WHEN day_of_week = 3 THEN 'Wednesday'
              WHEN day_of_week = 4 THEN 'Thursday'
              WHEN day_of_week = 5 THEN 'Friday'
              WHEN day_of_week = 6 THEN 'Saturday'
              WHEN day_of_week = 7 THEN 'Sunday'
         END AS 'Day',
         AVG(arr_delay) AS 'Average Delay (minutes)'
FROM     Flight_delays
GROUP BY day_of_week
ORDER BY AVG(arr_delay) DESC;