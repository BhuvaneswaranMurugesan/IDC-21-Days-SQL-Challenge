/*
**Phase 2: Filtering & Exploration**

1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
2. List pizzas with `price` descending.
3. Pizzas sold in sizes `'L'` or `'XL'`.
4. Pizzas priced between $15.00 and $17.00.
5. Pizzas with `"Chicken"` in the name.
6. Orders on `'2015-02-15'` or placed after 8 PM.
*/

--1. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
SELECT * FROM orders
WHERE date = '2015-01-01'

--2. List pizzas with `price` descending.
SELECT * FROM dbo.pizzas
ORDER BY price DESC

--3. Pizzas sold in sizes `'L'` or `'XL'`.
SELECT 
    *
FROM dbo.pizzas
WHERE size IN ('L', 'XL');

--4. Pizzas priced between $15.00 and $17.00.
SELECT 
    *
FROM dbo.pizzas
WHERE price between 15.00 and 17.00

--5. Pizzas with "Chicken" in the name.
SELECT 
    pizza_type_id,
	name,
	category
FROM dbo.pizza_types
where name like '%Chicken%'

--6. Orders on `'2015-02-15'` or placed after 8 PM.
SELECT 
    *
FROM dbo.orders
WHERE date = '2015-02-15' or time = '20:00:00'

