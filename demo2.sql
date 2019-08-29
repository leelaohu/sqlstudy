#显示系统时间（日期+时间）
SELECT NOW();
#查询员工号，姓名，工资以及工资提高20%后的结果（new salary）
SELECT employee_id,last_name,salary,
	salary*1.2 AS 'new salary'
	FROM 
	employees;
#将员工的姓名按首字符排序，并写出姓名的长度
SELECT LENGTH(last_name) AS 'count',SUBSTR(last_name,1,1) 首字符,last_name FROM employees ORDER BY 首字符; 
/*
   做一个查询产生下面的结果
   <last name> earns <salary> monthly but want <salary*3>
   dream salary 
   King earns 3000 monthly but want 9000
*/
SELECT CONCAT(last_name,' earn ',salary,' monthly but want ',salary*3) 'Dream salary' FROM employees;

/*
  使用case-when,按下面的条件
   job               grade
   AD_PRES           A
   ST_MAN            B
   IT_PROG           C
   SA_REP            D
   ST_CLERK          E
*/
  SELECT
  job_id 'job',
  CASE job_id
  WHEN 'AD_PRES' THEN 'A'
  WHEN 'ST_MAN' THEN 'B'
  WHEN 'IT_PROG' THEN 'C'
  WHEN 'SA_REP' THEN 'D'
  WHEN 'SH_CLERK' THEN 'E'
  END AS grade
  FROM employees;














