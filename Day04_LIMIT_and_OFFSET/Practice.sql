/*
1. Display the first 5 patients from the patients table.
2. Show patients 11-20 using OFFSET.
3. Get the 10 most recent patient admissions based on arrival_date.
*/

--1. Display the first 5 patients from the patients table.
SELECT TOP 5 * FROM dbo.patients

--2. Show patients 11-20 using OFFSET.
SELECT * FROM dbo.patients
ORDER BY patient_id
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

--3. Get the 10 most recent patient admissions based on arrival_date.
SELECT TOP 10 * FROM dbo.patients
ORDER BY arrival_date DESC