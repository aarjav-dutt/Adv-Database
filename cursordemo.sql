set serveroutput on
declare
	cursor curprogrammer is select e.first_name||' '||e.last_name, e.salary 
	from employees e, jobs j
	where e.job_id=j.job_id and j.job_title='Programmer' 
	order by e.salary;
	
	name varchar2(200);
	salary number(9,2);
	
begin
	for c1 in (select jobs.job_title, jobs.min_salary, jobs.max_salary, avg(employees.salary) avg_salary 
				from employees, jobs
				where employees.job_id=jobs.job_id
				group by jobs.job_title, jobs.min_salary, jobs.max_salary
				order by jobs.job_title)
	loop
		dbms_output.put_line(CHR(13) || CHR(10)||c1.job_title||'s, average salary is $'||c1.avg_salary);
	end loop;
	
	open curprogrammer;
	fetch curprogrammer into name, salary;
	
	dbms_output.put_line(CHR(13) || CHR(10)||'PROGRAMMERS');
	dbms_output.put_line('------------------------------------------');
	
	while curprogrammer%found loop
		dbms_output.put_line(name||' makes $'||salary);
		fetch curprogrammer into name, salary;
	end loop;
	
	close curprogrammer;	
	
	
end;
/
