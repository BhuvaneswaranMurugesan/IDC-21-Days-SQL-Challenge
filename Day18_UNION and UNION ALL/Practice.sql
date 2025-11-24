/*
1. Combine patient names and staff names into a single list.
2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
3. List all unique names from both patients and staff tables.
*/

--1. Combine patient names and staff names into a single list.
SELECT name FROM dbo.patients
UNION ALL
SELECT staff_name as [name] from dbo.staff

--2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT satisfaction FROM dbo.patients
WHERE satisfaction > 90
UNION ALL
SELECT satisfaction FROM dbo.patients
WHERE satisfaction < 50

--3.List all unique names from both patients and staff tables.
SELECT name FROM dbo.patients
UNION
SELECT staff_name as [name] from dbo.staff