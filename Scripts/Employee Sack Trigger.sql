CREATE TRIGGER trg_employee_sack
ON Employees
AFTER delete
AS
BEGIN
IF EXISTS(
		SELECT 1
		FROM staff_sack s
		JOIN deleted d ON
		s.name=d.name 
		AND s.manager_id=d.manager_id
		AND s.department=d.department
		)
	BEGIN
		RAISERROR('Staff already sacked',16,1);
	END
	ELSE
	BEGIN

	INSERT INTO staff_sack (emp_id, name, manager_id, department)
	SELECT emp_id, name, manager_id, department
	FROM deleted
	END

END

/*
===========================
Testing Trigger
===========================
DELETE FROM Employees
WHERE emp_id BETWEEN 1006 AND 1010
*/