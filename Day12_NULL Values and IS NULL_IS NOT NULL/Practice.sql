/*
1. Find all weeks in services_weekly where no special event occurred.
2. Count how many records have null or empty event values.
3. List all services that had at least one week with a special event.
*/

-- 1. Find all weeks in services_weekly where no special event occurred.
SELECT 
	distinct week
FROM services_weekly
where event = 'none'

-- 2. Count how many records have null or empty event values.
SELECT 
	COUNT(*) as [Count of Records]
FROM services_weekly
where event = 'none'

-- 3. List all services that had at least one week with a special event.
SELECT 
	DISTINCT service,event
FROM services_weekly
where event <> 'none'