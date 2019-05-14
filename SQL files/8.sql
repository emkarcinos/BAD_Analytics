--USE dbad_flights
--GO

WITH A1_23avg
AS
(
SELECT   carrier,
         AVG(avg1) AS 'avg'
FROM     (SELECT   carrier,
                   AVG(arr_delay) AS 'avg1'
          FROM     Flight_delays
          WHERE    month = 7
          GROUP BY carrier, day_of_month
          HAVING   day_of_month BETWEEN 1 AND 23) AS T1
GROUP BY  carrier
),
A24_31avg
AS
(
SELECT   carrier,
         AVG(avg2) AS 'avg'
FROM     (SELECT   carrier,
                   AVG(arr_delay) AS 'avg2'
          FROM     Flight_delays
          WHERE    month = 7
          GROUP BY carrier, day_of_month
          HAVING   day_of_month BETWEEN 24 AND 31) AS T2
GROUP BY  carrier
)
SELECT   T1.carrier AS 'Carrier',
         T1.avg-T2.avg AS 'Delay growth'
FROM     A1_23avg T1 INNER JOIN A24_31avg T2
                     ON T1.carrier = T2.carrier
ORDER BY T1.avg-T2.avg DESC;