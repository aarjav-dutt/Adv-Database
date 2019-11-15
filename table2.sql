set serverout on

declare
	type test_table is table of varchar(200) index by binary_integer;
	type empt_table is table of employees%rowtype(100) index by binary_integer;

	l_test test_table;
	l_empt empt_table;
begin
	l_test(0):='Aarjav';
	l_test(10):='Dutt';

	dbms_output.put_line(l_test(0));
	dbms_output.put_line(l_test(10));

	empt_table(1).employee_id:='1';
	empt_table(1).first_name:='Aarjav';

	dbms_output.put_line(l_empt(1));
	dbms_output.put_line(l_empt(1));

	l_test.delete(0); --Delete index 0
	l_test.delete; --Delete ALL
end;
/