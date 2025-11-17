/*
Question: Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members
available in their service. Only include patients from services that have more than 5 staff members. 
Order by number of staff descending, then by patient name.
*/

SELECT 
	P.patient_id,
	p.name as [patient name],
	p.service,
	COUNT(s.staff_id) as [Total No.of Staff]
FROM dbo.patients p
JOIN dbo.staff s ON p.service=s.service
GROUP BY P.patient_id,p.name,p.service
HAVING COUNT(s.staff_id) > 5
ORDER BY [Total No.of Staff] DESC;