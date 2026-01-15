CREATE TABLE staff_logs(
emp_id INT IDENTITY(1,1) PRIMARY KEY,
name NVARCHAR(50),
manager_id INT,
department NVARCHAR(50)
)