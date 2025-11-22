/*
1. Show each patient with their service's average satisfaction as an additional column.
2. Create a derived table of service statistics and query from it.
3. Display staff with their service's total patient count as a calculated field.
*/

-- 1. Show each patient with their service's average satisfaction as an additional column.
SELECT
	p.patient_id,
	p.name as [Patient Name],
	patient_sat.service,
	patient_sat.[Avg Satisfaction]
FROM
dbo.patients p
LEFT JOIN (SELECT 
		service,AVG(patient_satisfaction) as [Avg Satisfaction]
	FROM dbo.services_weekly
	GROUP BY service) as patient_sat
	ON p.service = patient_sat.service

--2. Create a derived table of service statistics and query from it.
SELECT
	*
FROM 
	(SELECT 
		service,
		AVG(patient_satisfaction) AS [AVG Patient Satisfaction],
		AVG(patients_admitted) AS [AVG Patients Admitted],
		AVG(patients_refused) AS [AVG Patients Refused]
	FROM dbo.services_weekly
	GROUP BY service
	) AS service_statistics

--3. Display staff with their service's total patient count as a calculated field.
SELECT
	staff_statistics.staff_name,
	staff_statistics.service,
	COUNT(p.patient_id) as [Total patient count]
FROM 
	(SELECT 
		staff_name,service
	FROM dbo.staff
	) AS staff_statistics
JOIN dbo.patients p ON p.service=staff_statistics.service
GROUP BY staff_statistics.staff_name,staff_statistics.service
