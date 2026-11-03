-- Purpose: count the farmers registered at each chilling centre.
-- Uses a LEFT JOIN so centres with no farmers still appear (with 0).
SELECT c.Center_id,
       c.Location,
       COUNT(f.Farmer_id) AS farmers
FROM chilling_center c
LEFT JOIN farmer f ON f.Center_id = c.Center_id
GROUP BY c.Center_id, c.Location
ORDER BY farmers DESC;
