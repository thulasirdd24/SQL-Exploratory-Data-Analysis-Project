SELECT
country,
SUM(sales) AS total_sales
FROM orders
GROUP BY country;
