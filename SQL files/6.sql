USE dbad_flights
GO

WITH reg_dlys
AS
(
SELECT   F1.carrier,
         (SELECT AVG(arr_delay_new)
          FROM   Flight_delays F2
          WHERE  F1.carrier=F2.carrier
          GROUP BY F2.carrier
          HAVING AVG(F1.arr_delay_new)>10) AS 'avg_delay'
FROM     Flight_delays F1
GROUP BY F1.carrier
),
carriers_sum
AS
(
SELECT COUNT(*)  AS 'sum'
FROM   (SELECT   COUNT(*) AS 'count'
        FROM     Flight_delays
        GROUP BY carrier) AS T
)
SELECT CAST((SELECT COUNT(*)
        FROM   reg_dlys t
        WHERE  t.avg_delay IS NOT NULL) /
                    CAST((SELECT *
                          FROM   carriers_sum) AS FLOAT) AS NUMERIC(5,3))
               AS 'Part of continuous delays';