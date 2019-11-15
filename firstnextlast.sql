set serveroutput on

declare
	type mytable is table of varchar2(200)
	index by binary_integer;

	l_table mytable;
	l_index number;
begin
	for emp_rec in (select * from employees) loop
		l_table(emp_rec.employee_id) :=emp_rec.first_name;
	end loop;

	l_index:=l_table.first;
	
	loop
		exit when l_index is null;
		dbms_output.put_line(l_index || ':' || l_table(l_index));
		l_index:=l_table.next(l_index);
	end loop;
	
end;
/