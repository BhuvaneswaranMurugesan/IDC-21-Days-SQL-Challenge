/*
Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and
the count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records.
Order by weeks present descending.
*/

SELECT
	s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	COUNT(ss.week) AS weeks_present
FROM
	dbo.staff s
LEFT JOIN dbo.staff_schedule ss ON s.staff_id=ss.staff_id
group by 
	s.staff_id, s.staff_name, s.role, s.service
ORDER by weeks_present desc;