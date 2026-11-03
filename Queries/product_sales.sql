-- Purpose: for each product, show how many units were sold and the revenue earned.
-- Products that were never ordered still appear, with 0.
SELECT p.Product_id,
       p.Product_Name,
       COALESCE(SUM(op.Quantity), 0) AS units_sold,
       COALESCE(SUM(op.Subtotal), 0) AS revenue
FROM product p
LEFT JOIN order_product op ON op.Product_id = p.Product_id
GROUP BY p.Product_id, p.Product_Name
ORDER BY revenue DESC;
