# Employee Manager Update Trigger

## 📌 Overview
This repository contains a SQL Server trigger (`trg_manager_update`) designed to track **manager changes** (promotions or demotions) for employees.  
Whenever the `manager_id` field in the `Employees` table is updated, the trigger ensures:

- Duplicate entries are **not allowed** in the `Employee_rank_change` table.  
- A new record is inserted into `Employee_rank_change` capturing:
  - Employee ID  
  - Employee name  
  - Former manager ID  
  - New manager ID  
  - Department  

---
# Trigger Logic
AFTER UPDATE trigger on Employees table.
Checks if a record with the same employee, name, new manager, and department already exists in Employee_rank_change.

If found → raises error:
```sql
Entry exists!!! Duplicate entry not allowed
```

