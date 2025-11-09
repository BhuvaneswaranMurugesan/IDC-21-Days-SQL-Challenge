/*
1. Count the number of patients by each service.
2. Calculate the average age of patients grouped by service.
3. Find the total number of staff members per role.
*/

--1. Count the number of patients by each service.
SELECT service,COUNT(patient_id) as [No.of Patients] FROM patients
GROUP BY
service

--2. Calculate the average age of patients grouped by service.
SELECT service,AVG(age) as [Avg Age of Patients] FROM patients
GROUP BY
service

--3. Find the total number of staff members per role.
SELECT role,COUNT(*) FROM staff
GROUP BY role
