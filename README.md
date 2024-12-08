# Big_Johns_SQL_PowerBI_Project

![Big Johns](https://media-cdn.tripadvisor.com/media/photo-s/28/d1/78/97/exterior-view-photo-by.jpg) 

Welcome to my SQL & Power BI project, where I analyze real-time pizza sales data from **The Big John's Pizza UK**! This project uses a dataset of **10,000 visit records** to explore and analyze gym membership and visit data, answering key business questions that can help a fitness center understand its customer base better and optimize its services.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Business Problems](#business-problems)
- [SQL Queries & Analysis](#sql-queries--analysis)
- [Power BI Dashboard Stages](#power-bi-dashboard-stages)
- [Getting Started](#getting-started)
- [Questions & Feedback](#questions--feedback)
- [Contact Me](#contact-me)

---

## Introduction

This project aims to demonstrate essential SQL and Power BI skills by analyzing a dataset from The Big John's UK Pizza parlour. Using SQL, I explored membership details, member demographics, and visit patterns to derive actionable insights. This project showcases fundamental SQL techniques, including creating tables, writing queries, and analyzing data.

## Project Structure

1. **Dataset**: Real-time data on pizza sales, membership, and member demographics..
2. **Importing Data**: Import the data into PostgreSQL Server.
4. **Analysis**: SQL queries solving practical business problems, each one crafted to address specific questions.
5. **Report Creation**: Report documenting all the business queries.
6. **Power BI Dashboard Creation**: Create the dashboard for the stakeholders in Power BI.

---

## Database Schema

Here’s an overview of the database structure:

### 1. **Pizza Sales Table**
- **pizza_id**: Unique identifier for each pizza
- **order_id**: Unique order identifier
- **pizza_name_id**: Unique pizza name identifier
- **quantity**: Quantity of pizza sold
- **order_date**: Date the order was placed
- **order_time**: Time the order was placed
- **unit_price**: Unit price per pizza
- **total_price**: Total order price after quantity
- **pizza_size**: Size of the pizza (S, M, L, XL)
- **pizza_category**: Category of the pizza (Classic, Veggie, Supreme, Chicken)
- **pizza_ingredients**: Ingredients served in pizza
- **pizza_name**: Name of the pizza

## Business Problems

The following queries analyze key indicators of pizza sales to provide insights into Big John's business performance.

### 1. KPI's

1. Total Revenue: The sum of total price of all pizza orders.

```sql
SELECT
	SUM(total_price) AS Total_Revenue
FROM pizza_sales;
```

2. Average Order Value: The average amount spent over per order.

```sql
SELECT
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza_sales;

```

3. Total Pizzas Sold: The sum of all quantities of pizzas sold.

```sql

SELECT
	SUM(quantity) AS Total_pizza_sold
FROM pizza_sales;

```

4. Total Orders: The total number of orders placed.

```sql

SELECT
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

```

5. Average Pizzas Per Order: The average number of pizzas sold per order.

```sql

SELECT
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM pizza_sales;

```

### 2. Charts Requirement

Queries to build charts visualizing pizza sales, providing insights and key trends.

1. Daily Trend for Total Orders: We created a bar chart to visualize the daily trend of total orders over a specific period, helping the business identify patterns and fluctuations in order volumes.
```sql

SELECT
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);


```
2. Monthly Trend for Total Orders: We created a line chart to show hourly order trends, helping the business identify peak hours and periods of high activity.
```sql

select
	DATENAME(MONTH, order_date) as Month_Name,
	COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date);


```
3. Percentage of Sales by Pizza Category: We created a pie chart to display sales distribution across pizza categories, helping the business identify popular categories and their contribution to overall sales.
```sql

SELECT
	pizza_category,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


```
4.  Percentage of Sales by Pizza Size: We created a pie chart to show sales distribution across pizza sizes, helping the business understand customer preferences and their impact on sales.
```sql

SELECT
	pizza_size,
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


```
5. Total Pizzas Sold by Pizza Category: We created a funnel chart to show the number of pizzas sold in each category, helping the business compare sales performance across categories.
```sql

SELECT
	pizza_category,
	SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

```
6. Top 5 Best Seller Pizzas by Revenue, Total Quantity and Total Orders: We created a bar chart showing the top-5 best-selling pizzas by revenue, quantity, and orders, helping the business identify popular pizza options.

By Revenue:
```sql

SELECT
	Top 5 pizza_name,
	SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;
```

By Total Quantity:
```sql

SELECT
	Top 5 pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;
```

By Total Orders:
```sql

SELECT
	Top 5 pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


```
7. Bottom 5 Worst Seller Pizzas by Revenue, Total Quantity and Total Orders: We created a bar chart showing the bottom-5 worst-selling pizzas by revenue, quantity, and orders, helping the business identify underperforming pizza options.

By Revenue:
```sql

SELECT
	Top 5 pizza_name,
	SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;
```

By Total Quantity:
```sql

SELECT
	Top 5 pizza_name,
	SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;
```

By Total Orders:
```sql

SELECT
	Top 5 pizza_name,
	COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
```
---

## SQL Queries & Analysis

The `analysis.sql` file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.

---

## Power BI Dashboard Stages

The dashboard creation involved the following stages:
- Connecting Power Bi with PostgreSQL to import the data.
- Implemented data cleaning in power query tool utilizing the transform data tools functionality.
- Implemented data processing utilizing the DAX functionalities to create custom columns (order_day, order_month, day_number, month_number, etc.).
- Building Charts and utilized advanced functionalities to format the same.

### 1. Main Page

![Big Johns](https://github.com/user-attachments/assets/23bb4802-5a3e-4d17-a095-8740b9b4df6d) 

### 2. Best & Worst Sellers Page

![Big Johns](https://github.com/user-attachments/assets/95016bd3-de01-4118-84dd-211120690a91) 

The `analysis.pbix` file contains the Power BI dashboard for this project, showcasing interactive visualizations and insights designed to address key business questions.

## Getting Started

### Prerequisites
- PostgreSQL (or any SQL-compatible database)
- Basic understanding of SQL

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/SudhinPillai26/The_Gym_Group_UK.git
   ```
2. **Set Up the Database**:
   - Run the `TheGymGroup_Schemas.sql` script to set up tables and insert sample data.

3. **Run Queries**:
   - Execute each query in `analysis.sql` to explore and analyze the data.

---

## Questions & Feedback

If you have any questions or feedback, feel free to create an issue or reach out!

---

## Contact Me
  
📧 **[Email](mailto:sudhinpillai1998@gmail.com)**  
📞 **Phone**: +44 7909308158  
