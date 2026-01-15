 -- CTE that returns employee hierachy by showing their level of management 
-- and their grouped management levels in form of quatiles.


CREATE TABLE ##EmployeeHierarchy(
name NVARCHAR(100),
department NVARCHAR(50),
level INT,
quatile INT
);

WITH OrgChart AS (
    -- Anchor: CEO
    SELECT 
        emp_id, 
        name, 
        manager_id, 
        department, 
        0 AS Level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: employees reporting to previous level
    SELECT 
        e.emp_id, 
        e.name, 
        e.manager_id, 
        e.department, 
        oc.Level + 1
    FROM Employees e
    INNER JOIN OrgChart oc ON e.manager_id = oc.emp_id
)
INSERT INTO ##EmployeeHierarchy (name,department,level,quatile)

SELECT 
    name,
    department,
    Level,
    NTILE(4) OVER (ORDER BY Level ASC) AS Quartile
FROM OrgChart
ORDER BY Quartile, Level;

SELECT*
FROM ##EmployeeHierarchy


