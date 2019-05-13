SELECT   F1.carrier,
         (SELECT   AVG(F2.arr_delay)
          FROM     Flight_delays F2
          WHERE    F1.carrier = F2.carrier
          GROUP BY F2.carrier) AS 'avg_delay'
FROM     Flight_delays F1
WHERE    F1.origin_city_name LIKE 'San Francisco%'
GROUP BY F1.carrier
ORDER BY avg_delay ASC;