# 📅 Capstone Project
📆 Date: 27/11  to 28/11

---

## 🧠 SQL Murder Mystery: “Who Killed the CEO?”

## **1. Story / Background**

The CEO of **TechNova Inc.** has been found dead in their office on **October 15, 2025, at 9:00 PM**.

You are the **lead data analyst** tasked with solving this case using SQL. All the clues you need are hidden in the company’s databases:

- Keycard logs
- Phone call records
- Alibis
- Evidence found in different rooms

Your mission is simple but challenging:

👉 **Find out who the killer is, where and when the crime took place, and how it happened — using only SQL queries.**


👉 1. Someone entered the CEO’s office around the time of the crime.

SELECT * FROM dbo.keycard_logs kl
JOIN dbo.employees e ON e.employee_id = kl.employee_id
WHERE exit_time <= '2025-10-15 21:00:00' and room = 'CEO Office'

![alt text](image.png)

2. 