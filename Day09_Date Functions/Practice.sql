/*
1. Extract the year from all patient arrival dates.
2. Calculate the length of stay for each patient (departure_date - arrival_date).
3. Find all patients who arrived in a specific month.
*/

--1. Extract the year from all patient arrival dates.
SELECT name,YEAR(arrival_date) as [patient arrival Year] FROM dbo.patients

--2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT name,DATEDIFF(DAY,arrival_date,departure_date) as [length of stay] FROM dbo.patients

--3. Find all patients who arrived in a specific month.
SELECT name,DATENAME(MONTH,arrival_date) as [Month Name] FROM dbo.patients