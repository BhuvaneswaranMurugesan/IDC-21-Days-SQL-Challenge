/*
Question: 
Find all patients admitted to 'Surgery' service with a satisfaction score below 70,
showing their       
*/
SELECT 
	patient_id,
	name,
	age,
	satisfaction
FROM dbo.patients
WHERE satisfaction<70;