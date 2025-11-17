/*
1. Join patients and staff based on their common service field (show patient and staff who work in same service).
2. Join services_weekly with staff to show weekly service data with staff information.
3. Create a report showing patient information along with staff assigned to their service.
*/

-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT *
FROM dbo.patients p
JOIN dbo.staff s ON p.service = s.service

-- 2. Join services_weekly with staff to show weekly service data with staff information.

SELECT *
FROM dbo.services_weekly sw
JOIN dbo.staff s ON sw.service = s.service

-- 3. Create a report showing patient information along with staff assigned to their service.

SELECT p.*,s.staff_id,s.staff_name
FROM dbo.patients p
JOIN dbo.staff s ON p.service = s.service