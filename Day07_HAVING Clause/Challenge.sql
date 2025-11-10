/*
Question: Identify services that refused more than 100 patients in total
and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.
*/

SELECT 
	service,
	SUM(patients_refused) as [Total refused],
	AVG(patient_satisfaction) as [AVG satisfaction]
FROM services_weekly
GROUP BY service
HAVING SUM(patients_refused)>100 AND AVG(patient_satisfaction) < 80