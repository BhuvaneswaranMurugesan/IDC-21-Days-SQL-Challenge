/*
Question: Calculate the average length of stay (in days) for each service,
showing only services where the average stay is more than 7 days.
Also show the count of patients and order by average stay descending.
*/

SELECT 
	service,
	COUNT(patient_id) as [Count of patients],
	AVG(DATEDIFF(DAY,arrival_date,departure_date)) as [AVG Length of Stay]
FROM patients
GROUP BY service
HAVING AVG(DATEDIFF(DAY,arrival_date,departure_date))>=7
ORDER BY [AVG Length of Stay] DESC