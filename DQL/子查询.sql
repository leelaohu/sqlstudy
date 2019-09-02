#进阶7：子查询
/*
   含义：出现在其他语句中的select语句叫做子查询或内查询
   外部的查询语句称为主查询或外查询
   
   分类：
   按子查询出现的位置
	select 后面 仅支持标量子查询
	from 后面  支持表子查询
	where 或 having 后面
	  标量子查询（单行）
	  列子查询   （多行）
	  
	  行子查询
	exists 后面（相关子查询）
	  表子查询
   案结果集的列数不同：
	标量子查询（结果集只有一行一列）
	列子查询（结果集只有一列多行）
	行子查询 （结果集有一行多列）
	表子查询（结果集一般为多行多列）
*/
#一、where having 后边的
/*
  标量子查询（单行）
  列子查询   （多行）
  
  行子查询  (多列多行)
  特点：
  1 子查询放在小括号内
  2 子查询一般放在条件的右侧
  3 标量子查询一般搭配着单行操作符使用
      <,>,=,<=,>=,<>
  
  4 列子查询一般搭配着多行操作符使用
    in any/some all
  5 子查询的执行优先于主查询，主查询的条件用到了子查询的结果
  
*/
 # 1.标量子查询
 /*
   ex: 谁的工资比Abel高
   1.查询Abel的工资
   2.查询员工的信息满足salary>1的结果
 */
 SELECT salary FROM employees WHERE last_name = 'Abel';
 
SELECT 
  * 
FROM
  employees 
WHERE salary > 
  (SELECT 
    salary 
  FROM
    employees 
  WHERE last_name = 'Abel'

); 
 /*
   ex2: 返回job_id与141号员工相同，salary比143号员工多的员工姓名，job_id和工资
   1.查询141号员工的job_id
   2.1查询143号员工的salary
   2.查询job_id与141号员工相同
   3.查询salary比143号员工多的
 */
SELECT job_id FROM employees WHERE employee_id = 141 ;
SELECT salary FROM employees WHERE employee_id = 143;
SELECT 
  last_name,job_id,salary 
FROM
  employees 
WHERE job_id = (
	SELECT job_id FROM employees WHERE employee_id = 141
)AND salary>(
	SELECT salary FROM employees WHERE employee_id = 143
);
/*
   ex2: 返回公司工资最少的员工的last_name,job_id,salary
   1.查询最小工资
   2.1查询对应的
 */
SELECT MIN(salary) FROM employees;
SELECT last_name,job_id,salary FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);
/*
   ex2: 查询最低工资大于50号部门最低工资的部门id和其最低工资
   1.查询50号部门最低工资
   2.查询每个部门最低工资
   3.筛选2，满足min(salary)>1
 */
SELECT MIN(salary) FROM employees WHERE department_id = 50;
SELECT MIN(salary),department_id FROM employees GROUP BY department_id;
SELECT 
  MIN(salary),
  department_id 
FROM
  employees 
GROUP BY department_id
HAVING MIN(salary)>(
 SELECT MIN(salary) FROM employees WHERE department_id = 50
);
# 1.列子查询（多行子查询）
  /*
   ex: 返回location_id是1400 或 1700 的部门中的所有员工姓名
   1.查询location_id是1400 或 1700 的部门编号
   2.筛选
 */
 SELECT DISTINCT(department_id) FROM departments WHERE location_id IN(1400,1700);
SELECT 
  last_name 
FROM
  employees 
WHERE department_id IN 
  (SELECT DISTINCT 
    (department_id) 
  FROM
    departments 
  WHERE location_id IN (1400, 1700)) ;
  #或
  SELECT 
  last_name 
FROM
  employees 
WHERE department_id =ANY 
  (SELECT DISTINCT 
    (department_id) 
  FROM
    departments 
  WHERE location_id IN (1400, 1700)) ;

  /*
   ex: 返回其他工种中比job_id为’IT_PROG‘工种中任一员工工资低的员工工号，姓名，job_id,salary;
   1.查询job_id为’IT_PROG‘部门任一工资
   2.筛选
 */
  SELECT salary FROM employees WHERE job_id = 'IT_PROG';
  SELECT last_name,job_id,salary FROM employees WHERE salary<ANY(
    SELECT salary FROM employees WHERE job_id = 'IT_PROG'
  ) AND job_id <>'IT_PROG';
  #>----------------------<
  SELECT last_name,job_id,salary FROM employees WHERE salary<(
    SELECT MAX(salary) FROM employees WHERE job_id = 'IT_PROG'
  ) AND job_id <>'IT_PROG';
 /*
   ex: 返回其他工种中比job_id为’IT_PROG‘工种中所有员工工资低的员工工号，姓名，job_id,salary;
   1.查询job_id为’IT_PROG‘部门任一工资
   2.筛选
 */ 
 SELECT last_name,job_id,salary FROM employees WHERE salary<ALL(
    SELECT salary FROM employees WHERE job_id = 'IT_PROG'
  ) AND job_id <>'IT_PROG';
  #>----------------------<
 SELECT last_name,job_id,salary FROM employees WHERE salary<(
    SELECT MIN(salary) FROM employees WHERE job_id = 'IT_PROG'
  ) AND job_id <>'IT_PROG';
 
 
# 1.行子查询（结果集一行多列或多行多列）
  /*
   ex: 查询员工编号最小的员工中的最高工资的员工信息
 */
SELECT * FROM employees WHERE (employee_id,salary)=(
	SELECT MIN(employee_id),MAX(salary) FROM employees
) 
 
 
#1.查询员工编号最小的
SELECT MIN(employee_id) FROM employees;
#2.查询最高工资
SELECT MAX(salary) FROM employees;
#3.查询员工信息
SELECT * FROM employees WHERE employee_id = (
	SELECT MIN(employee_id) FROM employees
) AND salary = (
	SELECT MAX(salary) FROM employees
);
 
 
#二、放在select后面
/*
   ex: 查询每个部门的员工个数
 */
SELECT d.*, (
	SELECT COUNT(*) FROM employees e
	WHERE e.department_id = d.department_id
) FROM departments d;
/*
   ex: 查询员工号为102的部门名
 */
SELECT(
	SELECT department_name
	FROM departments d 
	INNER JOIN employees e
	ON d.department_id = e.department_id
	WHERE e.employee_id = 102
) 部门名;

#三from后面
# 将子查询从当一张表，要求必须起别名
#查询每个部门的平均工资的工资等级
SELECT AVG(salary) FROM employees GROUP BY department_id;

SELECT * FROM job_grades;

SELECT ag_dep.*,g.grade_levle
FROM (
  SELECT AVG(salary) ag,department_id FROM employees GROUP BY department_id
) ag_dep INNER JOIN job_grades g
ON ag_dep.ag BETWEEN lowest_sal AND highest_sal

#exists后面（相关子查询）
#exists(完整的查询语句)






  
  