set serveroutput on
declare
begin
	for dept in (select department_id, department_name from departments order by department_id) 
	loop
		dbms_output.put_line('Dept id : '||dept.department_id||' is named '||dept.department_name);
	end loop;
end;
/