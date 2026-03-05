
--- FIND THE TOTAL CUSTOMERS BY COUNTRY
SELECT 
	country,
	count(customer_key) as Total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY Total_customers DESC

--- FIND THE TOTAL CUSTOMERS BY GENDER
SELECT 
	gender,
	COUNT(customer_key) AS Total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY Total_customers DESC

--- FIND THE TOTAL PRODUCTS BY CATEGORY
SELECT	
	category,
	COUNT(product_key) AS Total_products
FROM gold.dim_products
GROUP BY category
ORDER BY Total_products DESC


--- WHAT IS THE AVERAGE COSTS IN EACH CATEGORY?
SELECT 
	category,
	AVG(cost) AS AVG_COSTS
FROM gold.dim_products
GROUP BY category
ORDER BY AVG_COSTS DESC

--- WHAT IS THE TOTAL REVENUE GENERATED FOR EACH CATEGORY?
SELECT 
p.category,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC

--- FIND THE TOTAL REVENUE IS GENRATED BY EACH CUSTOMER
SELECT 
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.customer_key,
		c.first_name,
		c.last_name
ORDER BY total_revenue DESC

--- WHAT IS THE DISTRIBUTION OF SOLD ITEMS ACROSS COUNTRIES
SELECT 
c.country,
SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC

