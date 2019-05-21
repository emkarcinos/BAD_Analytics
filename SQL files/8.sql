USE dbad_flights
GO

WITH A1_23avg
AS
(
SELECT   carrier,
         AVG(arr_delay_new) AS 'avg'
FROM     Flight_delays
WHERE    day_of_month BETWEEN 1 AND 23
GROUP BY carrier
),
A24_31avg
AS
(
SELECT   carrier,
         AVG(arr_delay_new) AS 'avg'
FROM     Flight_delays
WHERE    day_of_month BETWEEN 24 AND 31
GROUP BY carrier
)
SELECT   TOP 1 T1.carrier AS 'Carrier',
               T2.avg-T1.avg AS 'Delay growth'
FROM     A1_23avg T1 INNER JOIN A24_31avg T2
                     ON T1.carrier = T2.carrier
ORDER BY T2.avg-T1.avg DESC;