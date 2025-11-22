/*
**Phase 3: Sales Performance**

1. Total quantity of pizzas sold (`SUM`).
2. Average pizza price (`AVG`).
3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
5. Categories with more than 5,000 pizzas sold (`HAVING`).
6. Pizzas never ordered (`LEFT/RIGHT JOIN`).
7. Price differences between different sizes of the same pizza (`SELF JOIN`).
*/

--1. Total quantity of pizzas sold (`SUM`).
SELECT
	SUM(quantity) as [Total quantity of pizzas sold]
FROM dbo.order_details

--2. Average pizza price (`AVG`).
SELECT 
	AVG(price) as [Average pizza price]
FROM pizzas

--3. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT
	od.order_id,
	SUM(od.quantity * p.price) AS total_order_value
FROM dbo.order_details od
JOIN dbo.pizzas p
	ON od.pizza_id = p.pizza_id
GROUP BY od.order_id
ORDER BY od.order_id

--4. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
SELECT
	pt.category,
	SUM(od.quantity) AS [Total quantity sold per pizza]
FROM dbo.order_details od
JOIN dbo.pizzas p ON p.pizza_id = od.pizza_id
JOIN dbo.pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP By pt.category
ORDER BY [Total quantity sold per pizza] DESC

--5. Categories with more than 5,000 pizzas sold (`HAVING`).
SELECT
	pt.category,
	SUM(od.quantity) AS [Total quantity sold per pizza]
FROM dbo.order_details od
JOIN dbo.pizzas p ON p.pizza_id = od.pizza_id
JOIN dbo.pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP By pt.category
HAVING SUM(od.quantity) > 5000
ORDER BY [Total quantity sold per pizza] DESC

--6. Pizzas never ordered (`LEFT/RIGHT JOIN`).
SELECT
	p.pizza_id
FROM dbo.order_details od
LEFT JOIN pizzas p ON p.pizza_id = od.pizza_id
WHERE p.pizza_id is NULL

--7. Price differences between different sizes of the same pizza (`SELF JOIN`).
SELECT 
    p1.pizza_type_id,
    p1.size AS size_1,
    p1.price AS price_1,
    p2.size AS size_2,
    p2.price AS price_2,
    ABS((p2.price - p1.price)) AS price_difference1,
	p3.size as size_3,
	p3.price as prize_3,
	ABS((p2.price - p3.price)) AS price_difference2
FROM pizzas p1
JOIN pizzas p2 ON p1.pizza_type_id = p2.pizza_type_id AND p1.size < p2.size
JOIN pizzas p3 ON p1.pizza_type_id = p3.pizza_type_id AND p2.size < p3.size