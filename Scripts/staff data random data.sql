-- Insert 1 million rows
INSERT INTO staff_logs_data (name, manager_id, department, hire_date, salary)
SELECT 
    'Employee_' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS NVARCHAR(100)),
    ABS(CHECKSUM(NEWID())) % 1000,  -- random manager_id
    CASE ABS(CHECKSUM(NEWID())) % 5
        WHEN 0 THEN 'Finance'
        WHEN 1 THEN 'HR'
        WHEN 2 THEN 'IT'
        WHEN 3 THEN 'Sales'
        ELSE 'Operations'
    END,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 3650, GETDATE()), -- random hire date in last 10 years
    ABS(CHECKSUM(NEWID())) % 100000  -- random salary
FROM sys.objects a
CROSS JOIN sys.objects b;

