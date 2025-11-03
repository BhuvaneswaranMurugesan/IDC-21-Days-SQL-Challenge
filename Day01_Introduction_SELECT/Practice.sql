/* Practice
1. Retrieve all columns from the `patients` table.
2. Select only the `patient_id`, `name`, and `age` columns from the `patients` table.
3. Display the first 10 records from the `services_weekly` table. */

--1. Retrieve all columns from the `patients` table.
SELECT * FROM patients;

--2. Select only the `patient_id`, `name`, and `age` columns from the `patients` table.
SELECT patient_id,name,age FROM patients;

--3. Display the first 10 records from the `services_weekly` table.
SELECT TOP 10 * FROM services_weekly;