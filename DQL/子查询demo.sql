#查询和Zlotkey相同部门的员工姓名和工资

SELECT department_id FROM employees WHERE last_name = 'Zlotkey';
SELECT last_name,salary FROM employees WHERE department_id = (
	SELECT department_id FROM employees WHERE last_name = 'Zlotkey'
);
#查询工资比公司平均工资高的员工的员工号，姓名，工资
SELECT AVG(salary) FROM employees;
SELECT 
  employee_id,
  last_name,
  salary 
FROM
  employees 
WHERE salary > 
  (SELECT 
    AVG(salary) 
  FROM
    employees

);
#查询部门中工资比本部门平均工资高的员工的员工号，姓名，工资
SELECT 
  AVG(salary),
  department_id 
FROM
  employees 
GROUP BY department_id ;

SELECT employee_id,last_name,salary FROM employees e INNER JOIN (
	SELECT 
	  AVG(salary) ag,
	  department_id 
	FROM
	  employees 
	GROUP BY department_id
) ag_dep 
ON e.department_id = ag_dep.department_id
WHERE salary >ag_dep.ag








