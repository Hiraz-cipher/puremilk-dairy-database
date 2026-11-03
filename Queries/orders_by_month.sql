-- Purpose: monthly order count and revenue, for tracking trends over time.
SELECT DATE_FORMAT(Order_date, '%Y-%m') AS month,
       COUNT(*)                         AS orders,
       SUM(Total_Price)                 AS revenue
FROM order_table
GROUP BY month
ORDER BY month;
