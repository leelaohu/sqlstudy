#查询个job_id的员工的工资的最大值，最小值，平均值，总和，并按jod_id升序
SELECT 
  MAX(salary),
  MIN(salary),
  AVG(salary),
  SUM(salary),
  job_id
FROM
  employees 
GROUP BY job_id
ORDER BY job_id ASC ;


#查询员工工资最大值和最小值得差距
SELECT 
  MAX(salary) - MIN(salary) distance 
FROM
  employees ;

#查询各个管理员手下员工的最低工资，其中最低工资不能小于6000，没有管理者的员工不计算在内
SELECT 
  MIN(salary),
  manager_id 
FROM
  employees 
WHERE manager_id IS NOT NULL 
GROUP BY manager_id 
HAVING MIN(salary) >= 6000 ;

#查询所有部门的编号，员工数量和工资平均值，并按平均工资降序
SELECT 
  department_id,
  COUNT(*),
  AVG(salary) a 
FROM
  employees 
GROUP BY department_id 
ORDER BY a ;

#选择具有各个job_id员工人数
SELECT 
  COUNT(*),
  job_id 
FROM
  employees 
GROUP BY job_id ;