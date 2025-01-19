## 1. What are the top 10 aisles with the highest number of products?
SELECT count(*) AS Product_count, aisle_id
FROM products GROUP BY aisle_id 
ORDER BY aisle_id DESC LIMIT 10;

## 2. How many unique departments are there in the dataset?
SELECT COUNT(DISTINCT department) AS Unique_departments FROM departments;

## 3. What is the distribution of products across departments?
SELECT department_id, count(*) AS Product_count 
FROM products GROUP BY department_id 
ORDER BY department_id;

## 4. What are the top 10 products with the highest reorder rates?
SELECT Avg(reordered) AS Reorder_rate, product_id 
FROM order_products_train 
GROUP BY product_id
ORDER BY Reorder_rate 
DESC LIMIT 10;

## 5. How many unique users have placed orders in the dataset?
SELECT COUNT(DISTINCT user_id) AS Unique_users FROM project_orders.orders;

## 6. What is the average number of days between orders for each user?
SELECT AVG(days_since_prior_order) 
AS Avg_days_between_orders, user_id 
FROM orders GROUP BY user_id;

## 7. What are the peak hours of order placement during the day?
SELECT order_hour_of_day, count(*) as hour_count 
FROM orders 
GROUP BY order_hour_of_day 
ORDER BY hour_count DESC;

## 8. How does order volume vary by day of the week?
SELECT order_dow, count(*) AS order_count 
FROM orders 
GROUP BY order_dow 
ORDER BY order_count DESC;

## 9. What are the top 10 most ordered products?
SELECT product_id, COUNT(*) AS product_count 
FROM project_orders.order_products_train
GROUP BY product_id
ORDER BY product_count DESC LIMIT 10;

##10. How many users have placed orders in each department?
SELECT p.department_id, count(DISTINCT o.user_id) AS user_count
FROM products p JOIN order_products_train opt 
ON p.product_id = opt.product_id 
JOIN orders o ON opt.order_id = o.order_id
GROUP BY p.department_id;

## 11. What is the average number of products per order?
SELECT order_id, AVG(product_id) AS avg_product_per_order
FROM order_products_train
GROUP BY order_id;

## 12. What are the most reordered products in each department?
SELECT p.department_id, opt.product_id, SUM(opt.reordered) AS reordered_products
FROM products p JOIN order_products_train opt
ON p.product_id = opt.product_id
GROUP BY opt.product_id 
ORDER BY reordered_products DESC;

## 13. How many products have been reordered more than once?
SELECT COUNT(*) AS products_reordered_more_than_once
FROM 
(SELECT product_id, SUM(reordered) AS reorder_count
FROM order_products_train
GROUP BY product_id HAVING reorder_count > 1) 
AS subquery;

## 14. What is the average number of products added to the cart per order?
SELECT order_id, AVG(product_id) AS avg_product_count
FROM order_products_train
GROUP BY order_id;

## 15. How does the number of orders vary by hour of the day?
SELECT order_hour_of_day, COUNT(*) AS order_number_count
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_number_count DESC;

## 16. What is the distribution of order sizes (number of products per order)?
SELECT product_count, COUNT(*) AS order_count
FROM (
    SELECT order_id, COUNT(*) AS product_count
    FROM order_products_train
    GROUP BY order_id
) subquery
GROUP BY product_count
ORDER BY product_count;

## 17. What is the average reorder rate for products in each aisle?


## 18. How does the average order size vary by day of the week?


## 19. What are the top 10 users with the highest number of orders?


## 20. How many products belong to each aisle and department?