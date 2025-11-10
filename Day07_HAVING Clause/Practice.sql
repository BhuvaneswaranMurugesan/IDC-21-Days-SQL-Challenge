/*
1. Find services that have admitted more than 500 patients in total.
2. Show services where average patient satisfaction is below 75.
3. List weeks where total staff presence across all services was less than 50.
*/

--1. Find services that have admitted more than 500 patients in total.
SELECT 
	service,
	SUM(patients_admitted) as [Patients Admitted]
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted)>500

--2. Show services where average patient satisfaction is below 75.
SELECT 
	service,
	AVG(patient_satisfaction) as [AVG patient satisfaction]
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction)<75

--3. List weeks where total staff presence across all services was less than 50.
select 
	staff_id,
	service,
	COUNT(staff_id) as [Total staff presence]
FROM staff_schedule
GROUP BY staff_id,service
HAVING COUNT(staff_id)<50