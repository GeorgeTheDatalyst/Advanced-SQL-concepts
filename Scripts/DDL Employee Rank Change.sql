CREATE TABLE Employee_rank_change(
emp_id INT,
name NVARCHAR(50),
former_manager_id INT,
new_manager_id INT,
department NVARCHAR(50),
change_date DATE DEFAULT GETDATE()
)