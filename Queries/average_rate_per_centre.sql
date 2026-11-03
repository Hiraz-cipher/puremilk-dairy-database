-- Purpose: average price paid per unit of milk at each centre,
-- and how many collections each centre made.
SELECT c.Location,
       COUNT(*)                          AS collections,
       ROUND(AVG(mt.Rate_Per_Unit), 2)   AS avg_rate_per_unit
FROM milk_transaction mt
JOIN chilling_center c ON c.Center_id = mt.Center_id
GROUP BY c.Location
ORDER BY avg_rate_per_unit DESC;
