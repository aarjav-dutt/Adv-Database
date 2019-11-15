set serverout on

declare
	type location_record1 is record(
		street_address varchar2(120),
		postal_code varchar2(12),
		city varchar2(50),
		state_province varchar(20),
		country_code char(2) not null := 'US'
	);


	type location_record2 is record(
		street_address varchar2(120),
		postal_code varchar2(12),
		city varchar2(50),
		state_province varchar(20),
		country_code char(2) not null := 'US'
	);

	my_loc location_record1;
	my_loc2 location_record1;

begin
	my_loc.street_address := '360 Huntington Ave';
	my_loc.postal_code := '02115';
	my_loc.city := 'Boston';
	my_loc.state_province := 'MA';
	
	my_loc2:=my_loc;

	dbms_output.put_line(my_loc.street_address ||', '||my_loc.city|| ', ' ||my_loc.state_province||','||my_loc.postal_code);
	dbms_output.put_line(my_loc2.street_address ||', '||my_loc2.city|| ', ' ||my_loc2.state_province||','||my_loc2.postal_code);

end;
/