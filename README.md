# 🗄️ SQL Server Employee Management Scripts

## 📌 Overview
This repository contains a collection of SQL Server scripts designed for **employee management** and **database optimization**.  
It includes triggers, stored procedures, recursive CTE examples, and advanced partitioning techniques.

---

---

## ⚙️ Features
- **Employee Sack Trigger (`trg_employee_sack.sql`)**  
  Logs employee termination events and prevents duplicate sack records.

- **New Employee Procedure (`proc_new_employee.sql`)**  
  Automates onboarding by inserting employee details into relevant tables.

- **New Employee Trigger (`trg_new_employee.sql`)**  
  Ensures integrity when new employees are added.

- **Recursive CTE with Temporary Tables (`recursive_cte_temp_tables.sql`)**  
  Demonstrates hierarchical queries (e.g., org chart traversal).

- **Table Partitioning (`table_partitioning.sql`)**  
  Improves query performance by splitting large tables into partitions.

- **File Groups (`file_groups.sql`)**  
  Shows how to distribute data across multiple file groups for scalability.

---

## 🧪 Testing
Each script includes sample test cases. For example:

```sql
-- Test manager update trigger
UPDATE Employees
SET manager_id = 1
WHERE emp_id = 1005;

-- Test sack trigger
DELETE FROM Employees
WHERE emp_id = 1010;

-- Test new employee procedure
EXEC new_staff 
  @name='Leez', 
  @manager_id = 1, 
  @department= 2
```

# Employee Manager Update Trigger

## 📌 Overview
This is a SQL Server trigger (`trg_manager_update`) designed to track **manager changes** (promotions or demotions) for employees.  
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
# Testing
You can test the trigger with the following example:
```sql
-- Example: Change manager for employee with ID 1005
UPDATE Employees
SET manager_id = 1
WHERE emp_id = 1005;
```
If this is the first time the manager is changed, a record will be inserted into Employee_rank_change.
If the same change already exists, the trigger will raise an error.

# Use Cases:
rack promotions/demotions in real-time.
Maintain a history of manager changes for auditing.
Prevent duplicate records in change logs.
# License
MIT 

