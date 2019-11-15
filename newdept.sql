declare
	l_dept departments%rowtype;
begin
	l_dept.department_id :=100;
	l_dept.department_name := 'MSIS Tech Dept';
	insert into departments (department_id, department_name) values (l_dept.department_id,l_dept.department_name);
exception
	when DUP_VAL_ON_INDEX then 
		dbms_output.put_line('INSERTION FAILED. DEPT 100 already exists');
end;
/