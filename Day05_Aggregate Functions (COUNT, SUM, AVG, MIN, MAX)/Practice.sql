/*
1. Count the total number of patients in the hospital.
2. Calculate the average satisfaction score of all patients.
3. Find the minimum and maximum age of patients.
*/

--1. Count the total number of patients in the hospital.
SELECT COUNT(*) as [Total No.of Patients] FROM dbo.patients

--2. Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) as [Avg Satisfaction Score] FROM dbo.patients

--3. Find the minimum and maximum age of patients.
SELECT MIN(age) as [MIN AGE],MAX(age) as [MAX AGE] FROM dbo.patients
