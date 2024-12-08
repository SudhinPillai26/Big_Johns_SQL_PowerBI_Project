-- 1. Total Revenue:
SELECT 
	SUM(total_price) AS 
Total_Revenue FROM pizza_sales;

-- 2. Average Order Value: The average amount spent over per order.
SELECT
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;

-- 3. Total Pizzas Sold: The sum of all quantities of pizzas sold.

SELECT
	SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

-- 4. Total Orders: The total number of orders placed.

SELECT
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- 5. Average Pizzas Per Order: The average number of pizzas sold per order.
SELECT
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM pizza_sales;


-- 6. Daily Trend for Total Orders
SELECT
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- 7.Monthly Trend for Orders

select
	DATENAME(MONTH, order_date) as Month_Name,
	COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date);


-- 8.% of Sales by Pizza Category
SELECT
	pizza_category,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


-- 9. % of Sales by Pizza Size

SELECT
	pizza_size,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

-- 10.Total Pizzas Sold by Pizza Category

SELECT
	pizza_category,
	SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- 11. Top 5 Pizzas by Revenue

SELECT
	Top 5 pizza_name,
	SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- 12. Bottom 5 Pizzas by Revenue

SELECT
	Top 5 pizza_name,
	SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- 13. Top 5 Pizzas by Quantity

SELECT
	Top 5 pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

-- 14. Bottom 5 Pizzas by Quantity

SELECT
	Top 5 pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

-- 15. Top 5 Pizzas by Total Orders

SELECT
	Top 5 pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- 16. Bottom 5 Pizzas by Total Orders
|
SELECT
	Top 5 pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
















