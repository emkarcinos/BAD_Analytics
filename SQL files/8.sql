--Average delays between 1 and 23 per carrier
DECLARE @1_23avg TABLE
(
       carrier VARCHAR(50),
       avg     FLOAT
)

INSERT INTO @1_23avg
SELECT   carrier,
         AVG(avg1) AS 'avg1A'
FROM     (SELECT   carrier,
                   AVG(arr_delay) AS 'avg1'
          FROM     Flight_delays
          WHERE    month = 7
          GROUP BY carrier, day_of_month
          HAVING   day_of_month BETWEEN 1 AND 23) AS T1
GROUP BY  carrier;


--Average delays between 24 and 31 per carrier
DECLARE @24_31avg TABLE
(
       carrier VARCHAR(50),
       avg     FLOAT
)

INSERT INTO @24_31avg
SELECT   carrier,
         AVG(avg2) AS 'avg2A'
FROM     (SELECT   carrier,
                   AVG(arr_delay) AS 'avg2'
          FROM     Flight_delays
          WHERE    month = 7
          GROUP BY carrier, day_of_month
          HAVING   day_of_month BETWEEN 24 AND 31) AS T2
GROUP BY  carrier;

--Final SELECT
SELECT   T1.carrier AS 'Carrier',
         T1.avg-T2.avg AS 'Delay growth'
FROM     @1_23avg T1 INNER JOIN @24_31avg T2
                     ON T1.carrier = T2.carrier
ORDER BY T1.avg-T2.avg DESC;