set serverout on

declare
	type test_table is table of varchar(200) index by binary_integer;
	type empt_table is table of employees%rowtype index by binary_integer;

	l_test test_table;
	l_empt empt_table;
begin
	l_test(0):='Aarjav';
	l_test(10):='Dutt';

	dbms_output.put_line(l_test(0));
	dbms_output.put_line(l_test(0));
	dbms_output.put_line(l_test(10));
end;
/