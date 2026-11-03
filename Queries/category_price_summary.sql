-- Purpose: summarise the product range by category:
-- number of products, average price and highest price.
SELECT Category,
       COUNT(*)                        AS products,
       ROUND(AVG(Price), 2)            AS avg_price,
       MAX(Price)                      AS max_price
FROM product
GROUP BY Category
ORDER BY avg_price DESC;
