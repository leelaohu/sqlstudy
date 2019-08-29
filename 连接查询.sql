/*
   连接查询
   笛卡尔乘积现象 表一有 m 行，表二有 n 行，结果 =  m*n
   分类
	按年代分
		sql92 仅仅支持内连接
		sql99 【推荐】 内连接+外连接（仅支持左外，右外）+交叉连接
	按功能分
		内连接
			等值连接
			非等值连接
			自连接
		外连接
			左外连接
			右外连接
			全外连接
		交叉连接
	
*/
#等值连接
#多表连接结果为多表的交集，多表连接的条件至少为n-1个 n为表的个数，多表的顺序没有要求
#一般需要为表写别名，可以搭配前边的所有字句使用比如排序、分组、筛选；
SELECT 
  NAME,
  boyName 
FROM
  beauty,
  boys 
WHERE beauty.boyfriend_id = boys.id ;

#一、sql92标准
 #1. 等值连接
SELECT 
  NAME,
  boyName 
FROM
  beauty,
  boys 
WHERE beauty.boyfriend_id = boys.id ;
#2.查询员工名和对应的部门名
SELECT 
  last_name,
  department_name 
FROM
  employees,
  departments 
WHERE employees.`department_id` = departments.`department_id` ;

#查询员工名，工种号，工种名
#为表起别名(如果起了别名，则查询的字段就不能使用原来的表名去限定)
SELECT 
  last_name,
  e.job_id,
  job_title 
FROM
  employees e,jobs j
WHERE e.`job_id` = j.`job_id` ;

#查询有奖金的员工名和部门名
SELECT 
  last_name,
  department_name 
FROM
  employees e,
  departments d 
WHERE e.`department_id` = d.`department_id`
AND `commission_pct` IS NOT NULL;

#查询城市名中的第二个字母为o的部门名和城市名
SELECT 
  department_name,
  city 
FROM
  departments d,
  locations l 
WHERE d.`location_id` = l.`location_id` 
AND
city LIKE '_o%';

#查询每个城市的部门个数
SELECT 
  COUNT(*) 个数,
  city 
FROM
  departments d,
  locations l 
WHERE d.`location_id` = l.`location_id` 
GROUP BY city ;
#查询有奖金的每个部门的部门名和部门领导的编号，和该部门员工最低工资
SELECT 
  MIN(salary),
  department_name,
  d.mana`manager_id`ger_id 
FROM
  departments d,
  employees e 
WHERE e.`department_id` = d.`department_id`
AND e.`commission_pct` IS NOT NULL
GROUP BY department_name,d.manager_id;
#查询每个工种的工种名和员工个数	并且按员工个数降序
SELECT 
  j.job_title,
  COUNT(*) 
FROM
  jobs j,
  employees e 
WHERE j.`job_id` = e.`job_id` 
GROUP BY `job_title`
ORDER BY COUNT(*) DESC ;
#查询员工名，部门名，所在城市
SELECT 
  last_name,
  department_name,
  city 
FROM
  employees e,
  departments d,
  locations l 
WHERE e.department_id = d.department_id 
  AND d.`location_id` = l.`location_id` ;

#非等值连接
SELECT * FROM job_grades;
#查询员工的工资和工资级别
SELECT 
  salary,
  grade_levle 
FROM
  employees e,
  job_grades j 
WHERE salary BETWEEN j.`lowest_sal` 
  AND j.`highest_sal` ;
#自连接
#查询员工名和上级的名字

SELECT e.last_name,d.last_name FROM employees e,employees d WHERE d.`manager_id` = e.`employee_id`;
#选择city在Toronto的员工的last_name,deparentment_name,job_id,deparentment_id
SELECT 
  last_name,
  job_id,
  e.department_id ,
  department_name
FROM
  employees e,
  departments d,
  locations l 
WHERE e.`department_id` = d.`department_id` 
AND d.`location_id` = l.`location_id`
  AND city = 'Toronto' ;

#查询每个国家下的部门个数大于2的国家编号
SELECT 
  country_id,
  COUNT(*) 
FROM
  departments,
  locations 
WHERE departments.`location_id` = locations.`location_id` 
GROUP BY country_id
HAVING COUNT(*)>2;