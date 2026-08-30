-- Sales Data Analysis using SQL
-- Synthetic sales dataset - January to June 2025
USE sales_analysis;

-- 1. Total number of orders
SELECT COUNT(order_id) AS total_orders
FROM sales_final;

-- 1. Total number of orders
SELECT COUNT(order_id) AS total_orders
FROM sales_final;

-- 2. Total revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales_final;

-- 3. Average order value
SELECT ROUND(AVG(quantity * price), 2) AS average_order_value
FROM sales_final;

-- 4. Revenue by product
SELECT product,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY product
ORDER BY revenue DESC;

-- 5. Revenue by category
SELECT category,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY category
ORDER BY revenue DESC;

-- 6. Revenue by region
SELECT region,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY region
ORDER BY revenue DESC;

-- 7. Revenue by customer
SELECT customer_name,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY customer_name
ORDER BY revenue DESC;

-- 8. Monthly revenue
SELECT MONTH(order_date) AS month,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY MONTH(order_date)
ORDER BY revenue DESC;

-- 9. Order value classification
SELECT order_type,
       COUNT(*) AS number_of_orders
FROM (
    SELECT
        CASE
            WHEN quantity * price >= 20000 THEN 'High Value'
            WHEN quantity * price >= 5000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS order_type
    FROM sales_final
) AS order_categories
GROUP BY order_type
ORDER BY number_of_orders DESC;

-- 10. Units sold by product
SELECT product,
       SUM(quantity) AS total_quantity
FROM sales_final
GROUP BY product
ORDER BY total_quantity DESC;

-- 11. Revenue by month and category
SELECT MONTH(order_date) AS month,
       category,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY MONTH(order_date), category
ORDER BY month, revenue DESC;

-- 12. Top 5 customers by revenue
SELECT customer_name,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY customer_name
ORDER BY revenue DESC
LIMIT 5;

-- 13. Top 5 products by revenue
SELECT product,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

-- 14. Revenue by city
SELECT customers_final.city,
       SUM(sales_final.quantity * sales_final.price) AS revenue
FROM sales_final
INNER JOIN customers_final
ON sales_final.customer_name = customers_final.customer_name
GROUP BY customers_final.city
ORDER BY revenue DESC;

-- 15. Top 5 customers with their city
SELECT customers_final.customer_name,
       customers_final.city,
       SUM(sales_final.quantity * sales_final.price) AS revenue
FROM sales_final
INNER JOIN customers_final
ON sales_final.customer_name = customers_final.customer_name
GROUP BY customers_final.customer_name, customers_final.city
ORDER BY revenue DESC
LIMIT 5;

-- 16. Customers with revenue above 100000
SELECT customer_name,
       SUM(quantity * price) AS revenue
FROM sales_final
GROUP BY customer_name
HAVING SUM(quantity * price) > 100000
ORDER BY revenue DESC;

-- 17. Number of orders by region
SELECT region,
       COUNT(order_id) AS total_orders
FROM sales_final
GROUP BY region
ORDER BY total_orders DESC;