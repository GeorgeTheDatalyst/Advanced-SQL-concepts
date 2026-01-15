CREATE TABLE staff_logs_data (
    emp_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100),
    manager_id INT,
    department NVARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10,2)
);


