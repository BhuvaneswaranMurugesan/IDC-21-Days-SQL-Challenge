/*
Question: For each service, rank the weeks by patient satisfaction score (highest first).
Show service, week, patient_satisfaction, patients_admitted, and the rank.
Include only the top 3 weeks per service.
*/

SELECT *
FROM (
	SELECT
		service,
		week,
		SUM(patient_satisfaction) as [patient_satisfaction],
		SUM(patients_admitted) as [patients_admitted],
		RANK() OVER(PARTITION BY service ORDER BY SUM(patient_satisfaction) DESC ,week DESC) as [Rank]
	FROM dbo.services_weekly
	GROUP BY service,week
	) AS result
WHERE result.Rank<=3