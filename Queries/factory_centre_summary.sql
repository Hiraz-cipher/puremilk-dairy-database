-- Purpose: for each factory, show how many chilling centres it supports
-- and the total capacity of those centres.
SELECT f.Factory_id,
       f.Factory_Name,
       COUNT(c.Center_id)            AS centres,
       COALESCE(SUM(c.Capacity), 0)  AS total_centre_capacity
FROM factory f
LEFT JOIN chilling_center c ON c.Factory_id = f.Factory_id
GROUP BY f.Factory_id, f.Factory_Name
ORDER BY total_centre_capacity DESC;
