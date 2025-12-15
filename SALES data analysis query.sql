
CREATE DATABASE sales_dataset;
use sales_dataset;



CREATE TABLE sales (
   order_id INT PRIMARY KEY,
   product VARCHAR(100) NOT NULL,
   category VARCHAR(50) NOT NULL,
   unit_price DECIMAL(10,2) NOT NULL,
   quantity INT NOT NULL CHECK (quantity > 0),
   order_date DATE NOT NULL,
   customer_id INT NOT NULL
);

INSERT INTO sales(order_id, product, category, unit_price, quantity, order_date, customer_id)
VALUES (
   1001, 'Wireless Mouse', 'Electronics', 450, 2, '2023-01-05', 201
);


INSERT INTO sales (order_id, product, category, unit_price, quantity, order_date, customer_id) VALUES
(1002, 'Bluetooth Keyboard', 'Electronics', 850, 1, '2023-01-06', 202),
(1003, 'USB-C Charger', 'Electronics', 650, 3, '2023-01-07', 203),
(1004, 'Running Shoes', 'Footwear', 2200, 1, '2023-01-08', 204),
(1005, 'Leather Wallet', 'Accessories', 1200, 2, '2023-01-09', 205),
(1006, 'Office Chair', 'Furniture', 7500, 1, '2023-01-10', 206),
(1007, 'Notebook Pack', 'Stationery', 150, 5, '2023-01-11', 207),
(1008, 'Ballpoint Pen Set', 'Stationery', 90, 10, '2023-01-12', 208),
(1009, 'Water Bottle', 'Home & Kitchen', 350, 2, '2023-01-13', 209),
(1010, 'Sneakers', 'Footwear', 1800, 1, '2023-01-14', 210),
(1011, 'Smartphone Case', 'Electronics', 300, 2, '2023-01-15', 211),
(1012, 'Yoga Mat', 'Sports', 900, 1, '2023-01-16', 212),
(1013, 'Backpack', 'Accessories', 1600, 1, '2023-01-17', 213),
(1014, 'LED Desk Lamp', 'Home & Kitchen', 1100, 1, '2023-01-18', 214),
(1015, 'Protein Powder', 'Health', 2500, 1, '2023-01-19', 215),
(1016, 'Gaming Headset', 'Electronics', 3200, 1, '2023-01-20', 216),
(1017, 'Electric Kettle', 'Home & Kitchen', 1800, 1, '2023-01-21', 217),
(1018, 'T-Shirt', 'Clothing', 550, 3, '2023-01-22', 218),
(1019, 'Jeans', 'Clothing', 1600, 1, '2023-01-23', 219),
(1020, 'Sunglasses', 'Accessories', 900, 1, '2023-01-24', 220);

INSERT INTO sales (order_id, product, category, unit_price, quantity, order_date, customer_id) VALUES
(1021, 'Laptop Stand', 'Electronics', 1400, 1, '2023-02-02', 221),
(1022, 'Desk Organizer', 'Home & Kitchen', 750, 1, '2023-02-05', 222),
(1023, 'Formal Shirt', 'Clothing', 1200, 2, '2023-02-08', 223),
(1024, 'Wireless Earbuds', 'Electronics', 2900, 1, '2023-02-10', 224),
(1025, 'Ceramic Mug Set', 'Home & Kitchen', 600, 4, '2023-02-12', 225),

(1026, 'Digital Watch', 'Accessories', 1800, 1, '2023-03-01', 226),
(1027, 'Cricket Bat', 'Sports', 2500, 1, '2023-03-03', 227),
(1028, 'Travel Pillow', 'Travel', 500, 2, '2023-03-05', 228),
(1029, 'Power Bank', 'Electronics', 1500, 1, '2023-03-07', 229),
(1030, 'Pressure Cooker', 'Home & Kitchen', 2200, 1, '2023-03-09', 230),

(1031, 'Graphic T-Shirt', 'Clothing', 700, 2, '2023-04-02', 231),
(1032, 'Bluetooth Speaker', 'Electronics', 2100, 1, '2023-04-04', 232),
(1033, 'Bed Pillow Set', 'Home & Kitchen', 1300, 2, '2023-04-07', 233),
(1034, 'Kitchen Knife Set', 'Home & Kitchen', 950, 1, '2023-04-09', 234),
(1035, 'Skipping Rope', 'Sports', 300, 3, '2023-04-11', 235),

(1036, 'Hardcover Notebook', 'Stationery', 250, 4, '2023-05-01', 236),
(1037, 'Cotton Socks Pack', 'Clothing', 350, 5, '2023-05-03', 237),
(1038, 'Face Moisturizer', 'Health & Personal Care', 450, 2, '2023-05-05', 238),
(1039, 'Table Clock', 'Home & Kitchen', 900, 1, '2023-05-07', 239),
(1040, 'Wireless Gamepad', 'Electronics', 2600, 1, '2023-05-09', 240);


--  Total Revenue
SELECT SUM(unit_price * quantity) AS Total_Revenue FROM sales;
-- Insight: Total revenue represents the overall sales performance

-- Revenue by Product
SELECT product, SUM(unit_price * quantity) AS Revenue FROM sales 
GROUP BY product 
ORDER BY revenue DESC;
-- Insight: office chair has the highes revenue among the other products followed by gaming headset


-- Top 5 Best-Selling Categories
SELECT category, SUM(quantity) AS total_units_sold FROM sales
GROUP BY category
ORDER BY total_units_sold DESC
LIMIT 5;
-- Insight: categories like stationery, electronics and home & kitchen are most units sold which suggests that high purchases of low priced everyday products

-- Monthly Sales Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
 SUM(unit_price * quantity) AS monthly_revenue 
FROM sales 
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


-- TOTAL SOLD QUANTITY
SELECT DATE_FORMAT(order_date, '%Y-%M') AS month,
       SUM(quantity) AS total_units_sold
FROM sales
GROUP BY month
ORDER BY month;
-- total units sold per month shows how certain months sold more units than other months this allows us to understand how customer demand trends across months

-- Most Frequently Purchased Product
SELECT product, COUNT(*) AS times_purchased
FROM sales
GROUP BY product
ORDER BY times_purchased DESC
LIMIT 1;
-- Insight: Wireless mouse is the most frequently purchased product indicating demand in commonly used electronic accessories