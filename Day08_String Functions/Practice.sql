/*
1. Convert all patient names to uppercase.
2. Find the length of each staff member's name.
3. Concatenate staff_id and staff_name with a hyphen separator.
*/

--1. Convert all patient names to uppercase.
SELECT UPPER(NAME) as Name FROM patients

--2. Find the length of each staff member's name.
SELECT LEN(staff_name) as [Length of Name] FROM staff

--3. Concatenate staff_id and staff_name with a hyphen separator.
SELECT CONCAT(staff_id,'-',staff_name) as [staff_id_name] FROM staff;