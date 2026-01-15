ALTER TRIGGER trg_new_staff
ON Employees
AFTER INSERT
AS
BEGIN

IF EXISTS(

		SELECT 1
		FROM staff_logs s
		JOIN inserted i ON
		s.name=i.name
		AND s.manager_id=i.manager_id
		AND s.department=i.department
	)
	BEGIN
		RAISERROR ('Duplicate staff entry not allowed',16,1);
	END
	ELSE
	BEGIN
		INSERT INTO staff_logs( name, manager_id, department)
		SELECT name, manager_id, department
		FROM inserted
	END

END

/*
===================
Testing Trigger
===================
INSERT INTO Employees(
name,
manager_id,
department)
VALUES
('Leez Onyango Audit', 2, 'Finance')
*/

