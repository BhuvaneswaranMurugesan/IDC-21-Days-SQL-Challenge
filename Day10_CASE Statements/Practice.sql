/*
1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
2. Label staff roles as 'Medical' or 'Support' based on role type.
3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
*/

--1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT
	name,
	satisfaction,
	CASE 
		WHEN satisfaction<60 then 'LOW'
		WHEN satisfaction>=60 AND satisfaction<90 then 'MEDIUM'
		WHEN satisfaction>=90 then 'HIGH'
	END AS [satisfaction Category]
FROM patients

--2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT 
	staff_name,
	role,
	CASE
		WHEN role='doctor' THEN 'MEDICAL'
		ELSE 'SUPPORT'
	END AS [role type]
FROM staff

--3.Create age groups for patients (0-18, 19-40, 41-65, 65+).

SELECT 
	name,
	age,
	CASE
		WHEN age>0 AND age<=18 THEN '0-18'
		WHEN age>18 AND age<=40 THEN '19-40'
		WHEN age>40 AND age<=65 THEN '41-65'
		ELSE '65+'
	END AS [Age Group]
FROM patients