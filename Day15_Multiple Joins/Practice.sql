/*
1. Join patients, staff, and staff_schedule to show patient service and staff availability.
2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
3. Create a multi-table report showing patient admissions with staff information.
*/

--1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT 
	*,
	CASE 
		WHEN ss.present = 1 THEN 'Available'
		ELSE 'Not Available'
	END AS [Availablity]
FROM
dbo.patients p
JOIN dbo.staff s ON p.service=s.service
JOIN dbo.staff_schedule ss ON ss.staff_id = s.staff_id

--2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT 
	*
FROM
dbo.services_weekly sw
JOIN dbo.staff_schedule ss ON ss.service = sw.service
JOIN dbo.staff s ON s.staff_name = ss.staff_name

--3. Create a multi-table report showing patient admissions with staff information.
SELECT 
	p.patient_id,
	p.name,
	p.age,
	p.arrival_date,
	s.*
FROM dbo.patients p
JOIN dbo.staff s ON s.service = p.service