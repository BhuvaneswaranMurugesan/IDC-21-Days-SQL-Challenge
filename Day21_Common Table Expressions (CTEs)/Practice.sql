/*
1. Create a CTE to calculate service statistics, then query from it.
2. Use multiple CTEs to break down a complex query into logical steps.
3. Build a CTE for staff utilization and join it with patient data.
*/

-- 1.Create a CTE to calculate service statistics, then query from it.
WITH CTE AS
(
	SELECT
		service,
		SUM(available_beds) as [Total Available beds],
		AVG(patient_satisfaction) as [AVG Patient Satisfaction]
	FROM dbo.services_weekly
	GROUP BY service
)
SELECT * FROM CTE

-- 2.Use multiple CTEs to break down a complex query into logical steps.
WITH CTE AS(
SELECT 
	service,
	AVG(satisfaction) as [AVG Satisfaction]
FROM dbo.patients
GROUP BY service
),
CTE_2 AS(
SELECT 
	service,
	SUM(patients_admitted) as [Total Patients Admitted]
FROM dbo.services_weekly
GROUP BY service
	)
SELECT * FROM CTE c
JOIN CTE_2 c2 ON c.service = c2.service

-- 3. Build a CTE for staff utilization and join it with patient data.
WITH staff_utilization AS(
	SELECT
		service,
		MONTH,
		week,
		SUM(available_beds) as [Total available beds]
	FROM dbo.services_weekly
	GROUP BY service,month,week
	),
patient_data AS(
	SELECT * FROM dbo.patients
)
SELECT * FROM patient_data pd
JOIN staff_utilization su ON pd.service=su.service