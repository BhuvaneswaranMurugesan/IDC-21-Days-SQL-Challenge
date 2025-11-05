/*
1. List all patients sorted by age in descending order.
2. Show all services_weekly data sorted by week number ascending and patients_request descending.
3. Display staff members sorted alphabetically by their names.
*/

--1. List all patients sorted by age in descending order.
SELECT * FROM dbo.patients
ORDER BY age DESC;

--2. Show all services_weekly data sorted by week number ascending and patients_request descending.
SELECT * FROM dbo.services_weekly
ORDER BY week ASC,patients_request DESC

--3. Display staff members sorted alphabetically by their names.
SELECT * FROM dbo.staff
ORDER BY staff_name