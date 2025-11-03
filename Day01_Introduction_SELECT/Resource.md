# 📅 Day 1: Introduction to SQL & SELECT Statement  
📆 Date: 03/11  

---

## 🧠 Topics Covered
- Basic SELECT statements
- Choosing columns  
- Viewing table structure  

---

## 🏥 Concept in Simple Terms

Key Concepts:
- Tables store data in rows (records) and columns (fields)
- SELECT defines which columns to retrieve
- FROM specifies which table to query
- Use semicolon (;) to end SQL statements

### 💡 Tips & Tricks

✅ **Avoid SELECT** * in production - it’s slower and returns data you might not need. Be specific!

✅ **Use column aliases** for readability:

```sql
SELECT name AS patient_name, age AS patient_age FROM patients;
```

✅ **Comment your code** using `--` for single lines or `/* */` for blocks

✅ **SQL keywords are case-insensitive** (SELECT = select = SeLeCt), but UPPERCASE is conventional

### Basic Syntax
```sql
SELECT column1, column2, column3
FROM table_name;
-- Select all columnsSELECT * FROM patients;
-- Select specific columnsSELECT patient_id, name, age FROM patients;