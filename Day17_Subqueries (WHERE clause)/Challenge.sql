/*
Question: Find all patients who were admitted to services that had at least one week where patients were refused 
AND the average patient satisfaction for that service was below the overall hospital average satisfaction.
Show patient_id, name, service, and their personal satisfaction score.
*/
SELECT DISTINCT * FROM
	(
	SELECT 
		p.patient_id,
		p.name,p.service,
		p.satisfaction as [Personal Satisfaction],
		(SELECT AVG(patient_satisfaction) FROM dbo.services_weekly) as avg_satisfaction
	FROM dbo.services_weekly sw
	JOIN dbo.patients p ON p.service = sw.service
	WHERE sw.patients_refused <> 0 AND
	(SELECT AVG(patient_satisfaction) FROM dbo.services_weekly) > p.satisfaction
	) AS result