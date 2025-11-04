/*Practice
1. Find all patients who are older than 60 years.
2. Retrieve all staff members who work in the 'Emergency' service.
3. List all weeks where more than 100 patients requested admission in any service.
*/

--1. Find all patients who are older than 60 years.
SELECT * FROM dbo.patients
WHERE age>60;

--2. Retrieve all staff members who work in the 'Emergency' service.
SELECT * FROM dbo.patients
WHERE service='emergency';

--3. List all weeks where more than 100 patients requested admission in any service.
select * from dbo.services_weekly
where patients_request>100;