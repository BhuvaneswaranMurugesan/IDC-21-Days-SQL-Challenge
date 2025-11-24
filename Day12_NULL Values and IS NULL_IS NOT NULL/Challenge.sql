/*
Question: Analyze the event impact by comparing weeks with events vs weeks without events.
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction,
and average staff morale. Order by average patient satisfaction descending.
*/
WITH CTE AS(
	SELECT *,
		CASE
			WHEN event = 'none' THEN 'No Event'
			ELSE 'With Event'
		END AS [Event Status]
	FROM services_weekly
)
SELECT
	[Event Status],
	COUNT(week) as [Count of weeks],
	AVG(patient_satisfaction) as [AVG patient satisfaction],
	AVG(staff_morale) as [AVG Staff morale]
FROM CTE
GROUP BY [Event Status]
ORDER BY AVG(patient_satisfaction)