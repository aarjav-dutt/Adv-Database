set serveroutput on
declare
	cursor empcursor is select * from employees	where rownum < 6 order by 1;
	
	emp employees%rowtype;
	row number := 1;
	
begin
	open empcursor;
	fetch empcursor into emp;
	loop
		if empcursor%found then 
			dbms_output.put_line('Rownum = '|| rownum ||'-Looping over record '|| row || ' of '|| empcursor%rowcount);
			
			fetch empcursor into emp;
			row:=row+1;
		elsif empcursor%notfound then 
			exit;
		end if;
	end loop;

	if empcursor%isopen then
		close empcursor;
	end if;
end;
/