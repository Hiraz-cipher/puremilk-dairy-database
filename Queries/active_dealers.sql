-- Purpose: list dealers that are currently active, largest credit limit first.
-- Dealer_Status is 1 = active, 0 = inactive.
SELECT Dealer_id,
       Dealer_Name,
       Location,
       Credit_Limit
FROM dealer
WHERE Dealer_Status = 1
ORDER BY Credit_Limit DESC;
