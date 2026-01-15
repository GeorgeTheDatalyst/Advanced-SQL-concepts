ALTER PROCEDURE new_staff
    @name NVARCHAR(100),
    @manager_id INT,
    @department NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(
    SELECT 1
    FROM staff_logs
    WHERE name = @name AND 
        manager_id =@manager_id AND 
        department=@department
        )
    BEGIN
    RAISERROR('Double entry not allowed,entry exists!!!', 16,1)
    END
    ELSE
    BEGIN

    -- Insert the new staff record
    INSERT INTO staff_logs (name, manager_id, department)
    VALUES (@name, @manager_id, @department);


    -- Capture the identity value of the inserted row
    DECLARE @id INT;
    SET @id = SCOPE_IDENTITY();

    -- Optionally return the new employee ID
    SELECT @id AS emp_id;
    END
END;

/* TESTING PROCEDURE
EXEC new_staff 
@name='Leez', 
@manager_id = 1, 
@department= 2

*/