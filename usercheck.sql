set serveroutput on
set echo off
set verify off
set define '&'

prompt 'Enter your body temp (numerically in degrees F)?: '
accept temperature default 100.0

declare 
	temperature_low exception;
	temperature_high exception;
	--tempval number;

begin
	--number := temerature;
	case 
		when &temperature<97 then raise temperature_low;
		when &temperature>100 then raise temperature_high;
		else null;
	end case;
	
	dbms_output.put_line('The body temp is within normal range. ');
	
exception
	when VALUE_ERROR then
		dbms_output.put_line('Please enter a valid numeric temerature. ');
	when temperature_high then 
		dbms_output.put_line('The temp is higher than normal range. ');
	when temperature_low then 
		dbms_output.put_line('The temp is lower than normal range. ');
end;
/