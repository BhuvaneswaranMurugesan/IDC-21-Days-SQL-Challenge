/*
1. Show all staff members and their schedule information (including those with no schedule entries).
2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
3. Display all patients and their service's weekly statistics (if available).
*/

-- 1. Show all staff members and their schedule information (including those with no schedule entries).

SELECT 
	s.*,
	ss.week,
	ss.present
FROM dbo.staff s
LEFT JOIN dbo.staff_schedule ss ON s.staff_name=ss.staff_name

--2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT 
	s.staff_id,
	s.staff_name,
	s.role,
	ss.*
FROM dbo.staff s
LEFT JOIN dbo.services_weekly ss ON s.service=ss.service

-- 3. Display all patients and their service's weekly statistics (if available).
SELECT 
	p.name,sw.service,SUM(CONVERT(INT, sw.week)) as [Total Week Contributed]
FROM dbo.patients p
LEFT JOIN dbo.services_weekly sw ON p.service = sw.service
group by p.name,sw.service