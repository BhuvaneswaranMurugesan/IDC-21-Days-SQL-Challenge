/*
Question: For each hospital service, calculate the total number of patients admitted,
total patients refused, and the admission rate (percentage of requests that were admitted).
Order by admission rate descending.
*/

SELECT 
    service,
	SUM(patients_admitted) as [Total No.of Patients Admitted],
	SUM(patients_refused) as [total patients refused],
    ROUND((CAST(SUM(patients_admitted) as float)/CAST(SUM(patients_request) as float))*100,2) 
	AS [percentage of requests that were admitted]
FROM services_weekly
GROUP BY service;