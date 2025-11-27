/*Create a comprehensive hospital performance dashboard using CTEs. Calculate: 
1) Service-level metrics(total admissions, refusals, avg satisfaction),
2) Staff metrics per service (total staff, avg weeks present),
3) Patient demographics per service (avg age, count).
Then combine all three CTEs to create a final report showing service name, all calculated metrics,
and an overall performance score (weighted average of admission rate and satisfaction).
Order by performance score descending.*/

WITH Service_level AS(
	SELECT sw.service,
		SUM(sw.patients_admitted) as [Total admission],
		SUM(sw.patients_refused) as [Total refusals],
		AVG(sw.patient_satisfaction) as [AVG Satisfaction] 
	FROM dbo.services_weekly sw
	GROUP BY sw.service),
Staff_metrics AS(
	SELECT service,
		COUNT(staff_id) AS [total staff],
		AVG(present) AS [Avg weeks present]
	FROM dbo.staff_schedule
	GROUP BY service
),
Patient_demographics AS
(
	SELECT
		service,
		AVG(age) as [AVG Age],
		COUNT(patient_id) as [Count of Patients]
	FROM dbo.patients
	GROUP BY service
)
SELECT 
	sl.*,
	sm.[Avg weeks present],sm.[total staff],
	pd.[AVG Age],pd.[Count of Patients]
FROM Service_level sl
JOIN Staff_metrics sm ON sl.service = sm.service
JOIN Patient_demographics pd ON sl.service = pd.service