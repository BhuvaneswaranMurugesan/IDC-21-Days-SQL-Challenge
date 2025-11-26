/*
1. Calculate running total of patients admitted by week for each service.
2. Find the moving average of patient satisfaction over 4-week periods.
3. Show cumulative patient refusals by week across all services.
*/

-- 1. Calculate running total of patients admitted by week for each service.

SELECT
	*,
	SUM(patients_admitted) OVER(PARTITION BY service ORDER BY week) as [Running Total of Patient Admitted]
FROM dbo.services_weekly

--2. Find the moving average of patient satisfaction over 4-week periods.
SELECT
	*,
	AVG(patient_satisfaction) OVER(PARTITION BY service ORDER BY month) as [Running Total of Patient Admitted]
FROM dbo.services_weekly

--3. Show cumulative patient refusals by week across all services.
SELECT 
    week,
    SUM(patients_refused) AS weekly_refusals,
    SUM(SUM(patients_refused)) OVER (ORDER BY week) AS cumulative_refusals
FROM dbo.services_weekly
GROUP BY week
ORDER BY week;
