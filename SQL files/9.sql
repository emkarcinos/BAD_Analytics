SELECT DISTINCT carrier AS 'Carrier'
FROM   Flight_delays
WHERE  origin LIKE 'SFO'
       AND
       (dest IN ('PDX', 'EUG'))
