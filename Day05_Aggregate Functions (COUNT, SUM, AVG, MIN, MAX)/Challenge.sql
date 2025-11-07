/*
Question: Calculate the total number of patients admitted, total patients refused,
and the average patient satisfaction across all services and weeks.
Round the average satisfaction to 2 decimal places.
*/

SELECT 
	SUM(patients_admitted) as [total no.of patients admitted],
	SUM(patients_refused) as [total patients refused],
	FORMAT(ROUND(AVG(patient_satisfaction),2),'0.00') as [average patient satisfaction]
FROM services_weekly;
