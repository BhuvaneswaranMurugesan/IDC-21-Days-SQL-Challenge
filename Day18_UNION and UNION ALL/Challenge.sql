/*Question: Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id),
full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or 'emergency'
services. Order by type, then service, then name.*/

SELECT 
	patient_id as [identifier],
	name as [Full name],
	service
FROM dbo.patients
WHERE service IN ('emergency','surgery')
UNION ALL
SELECT 
	staff_id as [identifier],
	staff_name as [Full name],
	service
FROM dbo.staff