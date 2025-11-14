/*Question: Find all unique combinations of service and event type from the services_weekly 
table where events are not null or none, along with the count of occurrences for each combination.
Order by count descending.*/

SELECT 
	DISTINCT service,
	event,
	COUNT(*) as [occurrences]
FROM services_weekly
where event is not null and event <> 'none'
group by service,event
ORDER by occurrences DESC