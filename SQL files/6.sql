SELECT (SELECT COUNT(*)
        FROM (SELECT   F1.carrier,
                       (SELECT AVG(arr_delay)
                        FROM   Flight_delays F2
                        WHERE  F1.carrier=F2.carrier
                        GROUP BY F2.carrier
                        HAVING AVG(F1.arr_delay)>10) AS 'avg_delay'
              FROM     Flight_delays F1
              GROUP BY F1.carrier) AS t
              WHERE    t.avg_delay IS NOT NULL) / CAST((SELECT COUNT(*)
                                                        FROM   (SELECT   COUNT(*) AS 'count'
                                                                FROM     Flight_delays
                                                                GROUP BY carrier) AS T) AS FLOAT) AS 'part_of_cont_delays';