CREATE TABLE staff_sack(
emp_id INT,
name NVARCHAR(50),
manager_id INT,
department NVARCHAR(50),
sack_date DATE DEFAULT GETDATE()

)

