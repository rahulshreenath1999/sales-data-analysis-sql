--  Total Revenue
SELECT 
    SUM(unit_price * quantity) AS Total_Revenue
FROM
    sales;
-- Insight: Total revenue represents the overall sales performance

SELECT 
    product, SUM(unit_price * quantity) AS Revenue
FROM
    sales
GROUP BY product
ORDER BY revenue DESC;
-- Insight: office chair has the highes revenue among the other products followed by gaming headset


SELECT 
    category, SUM(quantity) AS total_units_sold
FROM
    sales
GROUP BY category
ORDER BY total_units_sold DESC
LIMIT 5;
-- Insight: categories like stationery, electronics and home & kitchen are most units sold which suggests that high purchases of low priced everyday products

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(unit_price * quantity) AS monthly_revenue
FROM
    sales
GROUP BY month
ORDER BY month;
-- Insight: Monthly revenues shows a declining trend from January to May indicating that sales performance has decreased over time. Earlier months had higher revenue than later months

-- Monthly Revenue Ranking (Window Function)
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
SUM(unit_price * quantity) AS revenue,
RANK() OVER(ORDER BY SUM(unit_price * quantity) DESC) AS revenue_rank 
FROM sales 
GROUP BY month;
-- Insight: Here January has the highest revenue and is ranked first and May has the lowest revenue and is ranked last this indicates decline in monthly revenue


SELECT 
    DATE_FORMAT(order_date, '%Y-%M') AS month,
    SUM(quantity) AS total_units_sold
FROM
    sales
GROUP BY month
ORDER BY month;
-- total units sold per month shows how certain months sold more units than other months this allows us to understand how customer demand trends across months

SELECT 
    product, COUNT(*) AS times_purchased
FROM
    sales
GROUP BY product
ORDER BY times_purchased DESC
LIMIT 1;
-- Insight: Wireless mouse is the most frequently purchased product indicating demand in commonly used electronic accessories