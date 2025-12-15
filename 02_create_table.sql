CREATE TABLE sales (
   order_id INT PRIMARY KEY,
   product VARCHAR(100) NOT NULL,
   category VARCHAR(50) NOT NULL,
   unit_price DECIMAL(10,2) NOT NULL,
   quantity INT NOT NULL CHECK (quantity > 0),
   order_date DATE NOT NULL,
   customer_id INT NOT NULL
);