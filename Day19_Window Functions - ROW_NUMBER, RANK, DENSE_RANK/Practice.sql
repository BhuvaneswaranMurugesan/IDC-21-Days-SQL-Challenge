/*
1. Rank patients by satisfaction score within each service.
2. Assign row numbers to staff ordered by their name.
3. Rank services by total patients admitted.
*/

-- 1. Rank patients by satisfaction score within each service.

SELECT
	service,
	RANK() OVER(PARTITION BY service ORDER BY satisfaction DESC) as [Rank]
FROM dbo.patients

-- 2. Assign row numbers to staff ordered by their name.

SELECT 
	staff_name,
	ROW_NUMBER() OVER(ORDER BY staff_name) as [Row Number]
FROM dbo.staff

-- 3. Rank services by total patients admitted.

SELECT 
	service,
	SUM(patients_admitted) as [total patients admitted],
	RANK() OVER(ORDER BY SUM(patients_admitted) DESC) as [Rank]
FROM dbo.services_weekly
GROUP BY service