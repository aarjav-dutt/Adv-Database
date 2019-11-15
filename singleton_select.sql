set serveroutput on

declare
	l_empid employees.employee_id%type;
	l_empname employees.first_name%type;
	
begin
	select employee_id, first_name into l_empid,l_empname
	from employees
	where rownum=1;
	
	--for singleton always use rownum/primary key/ any value that will uniquly identify one single row.
	
	dbms_output.put_line(l_empid || ' : '|| l_empname);
	
end;
/