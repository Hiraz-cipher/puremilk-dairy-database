-- Purpose: list milk collections that have not been paid.
-- Payment_Status is 1 = paid, 0 = unpaid.
SELECT mt.Milk_Transaction_id,
       c.Location          AS centre,
       mt.Collection_time,
       mt.Rate_Per_Unit
FROM milk_transaction mt
JOIN chilling_center c ON c.Center_id = mt.Center_id
WHERE mt.Payment_Status = 0
ORDER BY mt.Rate_Per_Unit DESC;
