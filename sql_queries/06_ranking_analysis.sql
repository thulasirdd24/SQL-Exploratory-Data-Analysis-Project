SELECT TOP 5 product_name,
SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC;
