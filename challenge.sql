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





-- Task 2: Total Revenue by Product Category
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p. category
ORDER BY revenue DESC;



-- Task 3- Employees earning above their department average
SELECT
   e.first_name,
   e.last_name,
   d.name AS department_name,
   e.salary AS employee_salary,
   dept.avg_salary AS department_average
FROM employees e
JOIN (
   SELECT department_id, AVG(salary) AS avg_salary
   FROM employees
   GROUP BY department_id
) AS dept
   ON e.department_id = dept.department_id
JOIN departments d ON e.department_id = d.id
 WHERE e.salary > dept.avg_salary
 ORDER BY employee_salary DESC;



-- Task 4- Cities with Most Loyal Customers
SELECT city, COUNT(*) AS gold_members
FROM customers
WHERE loyalty_level ='Gold'
GROUP BY city
ORDER BY gold_members DESC

