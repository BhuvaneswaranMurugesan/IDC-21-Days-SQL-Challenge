/*
Question: Create a report showing each service with: service name, total patients admitted,
the difference between their total admissions and the average admissions across all services,
and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.
*/

SELECT 
	*,
	CASE 
		WHEN [Total Admission diffrence] > ([AVG admissions Per Service])
		THEN 'Above Average' WHEN [Total Admission diffrence] < ([AVG admissions Per Service])
		THEN 'Below Average' ELSE 'Average'
	END AS [Rank]
FROM
	(SELECT 
		sw.service,SUM(sw.patients_admitted) as [Total admissions Per Service],
		AVG(sw.patients_admitted) as [AVG admissions Per Service],
		(SELECT SUM(sw.patients_admitted) FROM dbo.services_weekly sw)-SUM(sw.patients_admitted) as [Total Admission diffrence]
	FROM dbo.services_weekly sw
	GROUP BY sw.service) as Admission_stats
ORDER BY Admission_stats.[Total admissions Per Service] DESC