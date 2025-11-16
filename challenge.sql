--Task 1: Top 5 customer spend

SELECT
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;
-- -- --Functioning





-- -- Task 2: Total Revenue by Product Category

SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p. category
ORDER BY revenue DESC;

--Functioning


-- Task 3- Employees earning above their department average

-- SELECT department_id, AVG(salary) AS avg_salary
-- FROM employees
-- GROUP BY department_id
-- ORDER BY avg_salary DESC;



-- -- -- Task 4- Cities with Most Loyal Customers
-- -- -- This one seemed a bit confusing being that there was only 4 gold members and all of which are in Tampa
-- -- -- If there were more it would display

SELECT city, COUNT(*) AS gold_members
FROM customers
WHERE loyalty_level ='Gold'
GROUP BY city
ORDER BY gold_members DESC
--Functioning