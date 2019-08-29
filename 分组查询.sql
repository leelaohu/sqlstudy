#进阶5：分组查询
/*
   语法：
      select 分组函数，列(要求出现在group by的后边)	
      from 表
      【where 筛选条件】
      group by 分组的列表
      【order by 子句】
      
      *** 查询列表必须特殊，要求是分组函数和group by 后出现的字段
      特点：分组查询中的筛选条件分为两类
			数据源 			位置		关键字
      分组前筛选	原始表			gorup by 前	where
      分组后筛选	分组后的结果集		group by 后	having
      
      分组函数做条件放在having字句中
      能用分组前筛选的就用分组前筛选
*/


#查询每个部门的平均工资
SELECT ROUND(AVG(salary),2),department_id FROM employees GROUP BY department_id;
#查询每个工种的最高工资
SELECT MAX(salary),job_id FROM employees GROUP BY job_id;
#查询每个位置上的部门个数
SELECT COUNT(*),location_id FROM departments;

#添加赛选条件
#查询邮箱中包含a字符的，每个部门的平均工资
SELECT 
 
  AVG(salary),
  department_id 
FROM
  employees 
WHERE email LIKE '%a%' 
GROUP BY department_id ;
#查询有奖金的每个领导手下员工的最高工资
SELECT 
  MAX(salary),
  manager_id 
FROM
  employees 
WHERE NOT ISNULL(commission_pct) 
GROUP BY manager_id ;

#查询员工个数大于2的部门
#1.查询每个部门的员工数
SELECT COUNT(*),department_id FROM employees GROUP BY department_id;
#2.根据1的结果进行筛选，查询哪个部门的员工数大于2   HAVING

SELECT COUNT(*),department_id FROM employees GROUP BY department_id HAVING COUNT(*)>2;	

#查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
#1.查询每个工种有奖金的员工的最高工资
SELECT 
  MAX(salary),
  job_id 
FROM
  employees 
WHERE commission_pct IS NOT NULL 
GROUP BY job_id ;

#2.根据1的结果进行筛选
SELECT 
  MAX(salary),
  job_id 
FROM
  employees 
WHERE commission_pct IS NOT NULL 
GROUP BY job_id 
HAVING MAX(salary) > 12000 ;
#查询领导编号>102得每个领导手下的最低工资>5000的领导编号是哪个，已及其最低工资
SELECT 
  MIN(salary),
  manager_id 
FROM
  employees 
WHERE manager_id > 102 
GROUP BY manager_id 
HAVING MIN(salary) > 5000 ;

#按表达式或函数分组
#ex 按员工的姓名长度分组，查询每一组的员工个数，筛选员工个数大于5的
SELECT 
  COUNT(*),
  LENGTH(last_name) len_name 
FROM
  employees 
GROUP BY LENGTH(last_name) 
HAVING COUNT(last_name)>5 ;

#按多个字段的分组
#查询每个部们每个工种的平均工资
SELECT 
  AVG(salary),
  job_id,
  department_id 
FROM
  employees 
GROUP BY job_id,
  department_id ;

#添加排序
#查询每个部们每个工种的平均工资，按平均工资的高低显示出来
SELECT 
  AVG(salary),
  job_id,
  department_id 
FROM
  employees 
GROUP BY job_id,
  department_id 
ORDER BY AVG(salary) DESC ;

