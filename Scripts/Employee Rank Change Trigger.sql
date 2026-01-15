ALTER TRIGGER trg_manager_update
ON 
Employees
AFTER UPDATE
AS
BEGIN

	SET NOCOUNT ON
		IF EXISTS(
				SELECT 1
				FROM Employee_rank_change e
				JOIN inserted i ON 
				e.emp_id = i.emp_id AND
				e.name=i.name AND
				e.new_manager_id = i.manager_id AND
				e.department=i.department
			  )
		BEGIN
			RAISERROR('Enrty exists!!! Duplicate entry not allowed', 16,1)
			RETURN;
		END
ELSE
	BEGIN

		INSERT INTO Employee_rank_change(emp_id,name,former_manager_id, new_manager_id,department)
		SELECT d.emp_id, d.name, d.manager_id ,i.manager_id,d.department
		FROM deleted d 
		JOIN inserted i ON 
			d.emp_id=i.emp_id AND
			d.name=i.name AND
			d.department=i.department 
		WHERE d.manager_id<>i.manager_id
	END

END

/*
===================================================================
Testing the Promotion or Demotion Trigger(Manager Change) Example
===================================================================
UPDATE Employees
SET manager_id = 1
WHERE emp_id = 1005 

*/