set serveroutput on

declare
	
begin
	update departments set department_name=department_name
	where 1=2;
	
	dbms_output.put_line('Update statement [where 1=2] effected '||sql%rowcount||' rows');
	
	update departments set department_name=department_name
	where 1=1;
	
	dbms_output.put_line('Update statement [where 1=1] effected '||sql%rowcount||' rows');

end;
/