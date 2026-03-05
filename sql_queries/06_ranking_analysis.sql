-- WHICH 5 PRODUCTS GENERATE THE HIGHEST REVENUE?
SELECT TOP 5
p.subcategory,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC

SELECT *
FROM(	
	SELECT 
	p.product_name,
	SUM(f.sales_amount) AS total_revenue,
	RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY p.product_name)t
WHERE rank_products <= 5
	

-- WHAT ARE THE 5 WORST-PERFORMING PRODUCTS IN TERMS OF SALES?
SELECT TOP 5
p.product_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
