USE dbad_flights
GO

SELECT   origin AS 'Origin',
         dest AS 'Destination',
         AVG(arr_delay_new) AS 'Delay'
FROM     Flight_delays
WHERE    origin IN ('MDW', 'ORD')
         AND dest IN ('SFO', 'SJC', 'OAK')
         AND crs_dep_time>1400
GROUP BY origin, dest
ORDER BY AVG(arr_delay_new) DESC;