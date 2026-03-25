USE amazon_ecommerce;

-- 1.What is the total revenue generated from all orders.
SELECT SUM(amount) as total_revenue
FROM sales_analysis;

-- 2.How many unique orders were placed on the platfrom
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales_analysis;


-- 3.Which product categories generate the highest revenue.
SELECT category, ROUND(SUM(amount),2) AS total_revenue 
FROM sales_analysis 
GROUP BY category 
ORDER BY total_revenue DESC LIMIT 5;

-- 4.Which states contribute the most to overall sales revenue
SELECT state,ROUND(SUM(amount),2) AS total_revenue
FROM sales_analysis
GROUP BY state
ORDER BY total_revenue DESC; 

-- 5.What are the top 10 best-selling products based on reveunue
SELECT style, Round(SUM(amount),2) AS revenue
FROM sales_analysis
GROUP BY style
ORDER BY revenue DESC
LIMIT 10;

-- 6.What is the mothly sales trend across the year.
SELECT month, ROUND(SUM(amount),2) AS monthly_revenue
FROM sales_analysis
GROUP BY month
ORDER BY month;  

-- 7.What is the distribution of order status (Delivered,Cancelled, etc)
SELECT status, COUNT(*) AS total_orders
FROM sales_analysis
GROUP BY status; 

-- 8.Which products generate revenue above the average product revenue
SELECT style, ROUND(SUM(amount),2) AS revenue
FROM sales_analysis
GROUP BY style
HAVING revenue > (
       SELECT AVG(product_revenue)
       FROM (
            SELECT SUM(amount) AS product_revenue
            FROM sales_analysis
            GROUP BY style
       ) AS avg_table
);       
 
-- 9.Rank the top 5 states by revenue.
SELECT state,
ROUND(SUM(amount),2) AS revenue,
RANK() OVER (ORDER BY SUM(amount) DESC) AS state_rank
FROM sales_analysis
GROUP BY state
LIMIT 5;

-- 10 Which cities generate the highest sales within each state
SELECT state,city, ROUND(SUM(amount),2) AS revenue
FROM sales_analysis
GROUP BY state, city
ORDER BY state, revenue DESC;

 
