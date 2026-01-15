CREATE TABLE Employees(
emp_id INT IDENTITY(1,1) PRIMARY KEY,
name NVARCHAR(100),
manager_id INT,
department NVARCHAR(50)
)