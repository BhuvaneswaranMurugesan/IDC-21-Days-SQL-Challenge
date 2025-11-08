/*Question: Find the 3rd to 7th highest patient satisfaction scores from the patients table,
showing patient_id, name, service, and satisfaction. Display only these 5 records.
*/
SELECT
	patient_id,
	name,
	service,
	satisfaction
FROM dbo.patients
ORDER BY satisfaction DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;