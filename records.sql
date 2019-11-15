set serverout on

declare
	type location_record is record(
		street_address varchar2(120),
		postal_code varchar2(12),
		city varchar2(50),
		state_province varchar(20),
		country_code char(2) not null := 'US'
	);

	my_loc location_record;
begin
	my_loc.street_address := '360 Huntington Ave';
	my_loc.postal_code := '02115';
	my_loc.city := 'Boston';
	my_loc.state_province := 'MA';
	
	dbms_output.put_line(my_loc.street_address ||', '||my_loc.city|| ', ' ||my_loc.state_province||','||my_loc.postal_code);
end;
/