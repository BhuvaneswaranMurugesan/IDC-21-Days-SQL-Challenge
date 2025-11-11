/*
Question: Create a patient summary that shows patient_id, full name in uppercase,service in lowercase,
age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length.
Only show patients whose name length is greater than 10 characters.
*/

SELECT
	PATIENT_ID,
	UPPER(NAME) AS [Full Name],
	LOWER(service) as [Service],
	age,
	CASE
		WHEN age >=65 THEN 'SENIOR'
		WHEN age >=18 THEN 'ADULT'
		ELSE 'MINOR'
	END AS [Age Category],
	LEN(NAME) AS [Len of Name] 
FROM
dbo.patients
WHERE LEN(NAME)>10;