/*
1. Find patients who are in services with above-average staff count.
2. List staff who work in services that had any week with patient satisfaction below 70.
3. Show patients from services where total admitted patients exceed 1000.
*/

--1. Find patients who are in services with above-average staff count.
SELECT *
FROM (
    SELECT p.name,p.service,COUNT(s.staff_id) AS [Staff Count]
	FROM dbo.patients p
	JOIN dbo.services_weekly sw ON sw.service = p.service
	JOIN dbo.staff s ON s.service = p.service
		GROUP BY p.service, p.name
) AS Staffdetails 
WHERE Staffdetails.[Staff Count] > (
        SELECT AVG(staff_count_value)
        FROM (
            SELECT COUNT(staff_id) AS staff_count_value
            FROM dbo.staff
            GROUP BY service
        ) AS result
    );

--2. List staff who work in services that had any week with patient satisfaction below 70.
--2. List staff who work in services that had any week with patient satisfaction below 70.

SELECT 
    sw.week,
    sw.service,
    sw.patient_satisfaction,
    s.staff_name
FROM dbo.services_weekly sw
JOIN dbo.staff s 
      ON sw.service = s.service
WHERE sw.patient_satisfaction < 70
  AND EXISTS (
        SELECT 1
        FROM dbo.staff st
        WHERE st.service = sw.service
    );

--3. Show patients from services where total admitted patients exceed 1000.

SELECT * FROM
	(SELECT 
		p.service,
		p.name,
		SUM(sw.patients_admitted) as [Total Admitted patients]
	FROM dbo.patients p
	JOIN dbo.services_weekly sw ON p.service = sw.service
	GROUP BY p.name,p.service) 
as patient_info 
WHERE patient_info.[Total Admitted patients]>1000
ORDER BY patient_info.[Total Admitted patients] DESC