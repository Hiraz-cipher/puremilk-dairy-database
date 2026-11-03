-- Purpose: find milk collections with fat content of 3.8% or more.
-- Fat_Content is stored as text, so it is converted to a number first.
SELECT Milk_Transaction_id,
       CAST(Fat_Content AS DECIMAL(3,1)) AS fat_percent,
       Center_id
FROM milk_transaction
WHERE CAST(Fat_Content AS DECIMAL(3,1)) >= 3.8
ORDER BY fat_percent DESC;
