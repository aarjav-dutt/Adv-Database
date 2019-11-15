set serveroutput on

declare
	cursor emp_cur(p_deptid in number)
	is select * from employees
		where department_id=p_deptid;
		
	l_emp employees%rowtype;
	
begin
	dbms_output.put_line('Getting Employees for department 30');
	open emp_cur(30);
	
	loop
		fetch emp_cur into l_emp;
		exit when  emp_cur%notfound;
		dbms_output.put_line('Employee Id:'||l_emp.employee_id||' is '||l_emp.first_name||' '||l_emp.last_name);
	end loop;
	
	close emp_cur;

end;
/