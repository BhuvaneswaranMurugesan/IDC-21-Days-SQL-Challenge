/*
Question: Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week,
total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present
that week. Order by patients admitted descending.
*/

SELECT 
	p.service,
	SUM(sw.patients_admitted) as [Total patients admitted],
	SUM(sw.patients_refused) as [Total patients refused],
	AVG(p.satisfaction) as [Average patient satisfaction],
	COUNT(s.staff_id) as [Count of staff assigned to service]
FROM dbo.patients p
JOIN dbo.staff s ON s.service = p.service
JOIN dbo.services_weekly sw ON sw.service = s.service
JOIN dbo.staff_schedule ss ON s.staff_name = ss.staff_name
where sw.week=20
GROUP BY p.service
ORDER BY [Total patients admitted] DESC