#查询工资最低的员工的last_name,salary
SELECT MIN(salary) FROM employees;
SELECT last_name,salary FROM employees WHERE salary = (
	SELECT MIN(salary) FROM employees
);
#查询平均工资最低的部门信息

#1.查询每个部门的平均工资
SELECT AVG(salary),department_id FROM employees GROUP BY department_id;

#2.查询最低的平均工资
SELECT 
  MIN(ag) 
FROM
  departments d,
  (SELECT 
    AVG(salary) ag,
    department_id 
  FROM
    employees 
  GROUP BY department_id) ag_dep 
  
#3.查询最低的平均工资的部门id
  SELECT 
    AVG(salary),
    department_id 
  FROM
    employees 
  GROUP BY department_id 
  HAVING AVG(salary) = 
    (SELECT 
      MIN(ag) 
    FROM
      departments d,
      (SELECT 
        AVG(salary) ag,
        department_id 
      FROM
        employees 
      GROUP BY department_id) ag_dep) ;
      
 #4.查询最低的平均工资的部门info   
SELECT 
  d.* 
FROM
  departments d 
WHERE d.`department_id` = 
  (SELECT 
    department_id 
  FROM
    employees 
  GROUP BY department_id 
  HAVING AVG(salary) = 
    (SELECT 
      MIN(ag) 
    FROM
      departments d,
      (SELECT 
        AVG(salary) ag,
        department_id 
      FROM
        employees 
      GROUP BY department_id) ag_dep));
#或

#1.查询每个部门的平均工资
SELECT AVG(salary),department_id FROM employees GROUP BY department_id;
#2.查询最低的平均工资的部门id
SELECT 
  department_id 
FROM
  employees 
GROUP BY department_id 
ORDER BY AVG(salary) 
LIMIT 1;
 #3.查询最低的平均工资的部门info  
 SELECT d.* FROM departments d WHERE d.`department_id` = (
	 SELECT 
	  e.department_id 
	FROM
	  employees e
	GROUP BY e.department_id 
	ORDER BY AVG(salary) 
	LIMIT 1
 )


#查询平均工资最低的部门信息和平均工资
#1.查询每个部门的平均工资
SELECT AVG(salary),department_id FROM employees GROUP BY department_id;
#2.查询最低的平均工资的部门id和平均工资
SELECT 
  AVG(salary) ag,
  department_id 
FROM
  employees 
GROUP BY department_id 
ORDER BY AVG(salary) 
LIMIT 1;
# #3.查询最低的平均工资的部门info
SELECT d.*,ag FROM departments d 
JOIN(
	SELECT 
	  AVG(salary) ag,
	  department_id 
	FROM
	  employees 
	GROUP BY department_id 
	ORDER BY AVG(salary) 
	LIMIT 1
) ag_dep
ON d.department_id = ag_dep.department_id;


#查询平均工资高于公司平均工资的部门有哪些
SELECT AVG(salary),department_id FROM employees GROUP BY department_id;
SELECT AVG(salary) FROM employees ;

SELECT 
  AVG(salary),
  department_id 
FROM
  employees 
GROUP BY department_id 
HAVING AVG(salary)>(

	SELECT AVG(salary) FROM employees 
);
