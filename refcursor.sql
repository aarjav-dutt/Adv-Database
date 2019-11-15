declare
	type emp_job_rec is record(
		employee_id number,
		employee_name varchar2(60),
		job_title varchar2(40));
		
	type emp_job_refcur_type is ref cursor
		return emp_job_rec;
		
	emp_refcur emp_job_refcur_type;
	emp_job emp_job_rec;
	
	
	--type refcur_t ref cursor;
	--type emp_refcur_t is ref cursor
		--return employees%rowtype;       d-------strong cursor
		
begin
	open emp_refcur for select employees.employee_id, employees.first_name||employees.last_name "employee_name", jobs.job_title
	from employees,jobs
	where employees.job_id=jobs.job_id;
	
	fetch emp_refcur into emp_job;
	
	while emp_refcur%found loop
		dbms_output.put_line(emp_job.employee_name||' works as a '||emp_job.job_title);
		fetch emp_refcur into emp_job;
	end loop;
	
end;
/