# 📅 Day 2: Introduction to SQL & SELECT Statement  
📆 Date: 04/11  

---

## 🧠 Topics Covered
- Comparison: =, !=, <>, >, <, >=, <=
- Logical: AND, OR, NOT
- Pattern: LIKE, IN, BETWEEN

### 💡 Tips & Tricks

✅ Use IN instead of multiple ORs - more readable and faster:
-- ❌ Avoid: WHERE service = 'A' OR service = 'B' OR service = 'C'-- ✅ Better: WHERE service IN ('A', 'B', 'C')
​
✅ Strings need single quotes, numbers don’t:
WHERE age = 50        -- correctWHERE age = '50'      -- works but not idealWHERE name = 'John'   -- correctWHERE name = John     -- ERROR
​
✅ Use parentheses with mixed AND/OR to avoid confusion:
WHERE (age < 18 OR age > 65) AND service = 'Emergency'

### Basic Syntax
```sql
SELECT column1, column2, column3
FROM table_name;
-- Select all columnsSELECT * FROM patients;
-- Select specific columnsSELECT patient_id, name, age FROM patients;