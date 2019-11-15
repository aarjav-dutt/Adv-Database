set serveroutput on
set verify off
set define &
prompt
prompt 'What table would you like to see? '
accept tab prompt '(L)ocations, (D)epartments or (E)mployees : '
prompt
declare
	type refcur_type is ref cursor;
	refcur refcur_type;
	
	type sample_rec_type is record(
		id number,
		description varchar2(200)
	);
	
	sample sample_rec_type;
	selection varchar2(1) := upper(substr('&tab',1,1));

begin
	if selection = 'L'then
		open refcur for select location_id, street_address||', '||city from locations
		where rownum<11
		order by 1;
		dbms_output.put_line('Sample Location Data: ');
		
	elsif selection = 'D' then
		open refcur for select department_id, department_name from departments
		where rownum<11
		order by 1;
		dbms_output.put_line('Sample Department Data: ');
	
	elsif selection = 'E' then
		open refcur for select employee_id, first_name||' '||last_name  from employees
		where rownum<11
		order by 1;
		dbms_output.put_line('Sample Employee Data: ');
	
	else 
		dbms_output.put_line('Please enter ''L'', ''D'' or ''E'' ');
		return;
	end if;
	
	dbms_output.put_line('-------------------------------------------------------------');
	
	fetch refcur into sample;
	
	while refcur%found loop
		dbms_output.put_line('#' || sample.id || ' is '||sample.description);
		fetch refcur into sample;
	end loop;
	close refcur;
end;
/