/*Question: Create a trend analysis showing for each service and week: week number, patients_admitted,
running total of patients admitted (cumulative), 3-week moving average of patient satisfaction
(current week and 2 prior weeks), and the difference between current week admissions and the service average.
Filter for weeks 10-20 only.
*/

SELECT
	sw.service,
	sw.week,
	SUM(sw.patients_admitted) OVER(PARTITION BY sw.service ORDER BY sw.week) as [cumulative patients admitted],
	AVG(sw.patient_satisfaction) OVER(PARTITION BY sw.service ORDER BY sw.week ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) 
	as [3 week avg patient satisfaction],
	sw.patients_admitted - (SELECT AVG(sw2.patients_admitted * 1.0)
							FROM dbo.services_weekly sw2 
							WHERE sw.service=sw2.service AND week BETWEEN 10 AND 20
							GROUP BY service) as [diffrence]
FROM dbo.services_weekly sw
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;