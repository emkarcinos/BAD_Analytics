USE dbad_flights
GO

SELECT DISTINCT carrier
FROM   Flight_delays
WHERE  origin LIKE 'SFO'
       AND dest LIKE 'PDX'

INTERSECT

SELECT DISTINCT carrier
FROM   Flight_delays
WHERE  origin LIKE 'SFO'
       AND dest LIKE 'EUG'
