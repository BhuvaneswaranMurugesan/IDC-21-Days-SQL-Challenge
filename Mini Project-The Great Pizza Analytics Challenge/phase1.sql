/*
**Phase 1: Foundation & Inspection**

1. Install IDC_Pizza.dump as IDC_Pizza server
2. List all unique pizza categories (`DISTINCT`).
3. Display `pizza_type_id`, `name`, and ingredients, replacing NULL ingredients with `"Missing Data"`. Show first 5 rows.
4. Check for pizzas missing a price (`IS NULL`).
*/

-- 1. List all unique pizza categories
select DISTINCT category from dbo.pizza_types;

-- 2. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
select top 5 
    pizza_type_id, 
    name, 
    ISNULL(ingredients, 'Missing Data') as ingredients
from dbo.pizza_types;

-- 3. Check for pizzas missing a price
select * 
from dbo.pizza_types
where price IS NULL;