-- Purpose: for each dealer, count their orders and add up what they spent.
-- Dealers with no orders still appear, with 0.
SELECT d.Dealer_id,
       d.Dealer_Name,
       COUNT(o.order_id)            AS orders,
       COALESCE(SUM(o.Total_Price), 0) AS total_spent
FROM dealer d
LEFT JOIN order_table o ON o.Dealer_id = d.Dealer_id
GROUP BY d.Dealer_id, d.Dealer_Name
ORDER BY total_spent DESC;
