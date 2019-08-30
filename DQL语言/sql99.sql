#sql99语法
/*
   语法：
	select 查询列表
	from 表1 别名【连接类型】
	join 表2 别名
	on 连接条件
	 【where筛选条件】
	 【group by 分组】
	 【having 筛选条件】
	 【order by 排序列表】
	
   内连接(*)  inner
   外连接
	左外(*) left【outer】
	右外(*) right【outer】
	全外    full 【outer】
   交叉连接 cross
*/
/*一、内连接
   语法：
   select 查询列表
	from 表1 别名
	inner join 表2 别名
	on 连接条件
  分类：
    等值连接
    非等值连接
    自连接
   筛选条件放在where后边连接条件放在on后边，提高分离性，便于阅读
       
    
    
*/
#1.等值连接
#ex：查询员工名，部门名
SELECT 
  last_name,
  department_name 
FROM
  employees e 
  INNER JOIN departments d 
WHERE e.`department_id` = d.`department_id` ;
#ex:查询名字中包含e的员工名和工种名（添加筛选）
SELECT 
  last_name,
  job_title 
FROM
  employees e 
  INNER JOIN jobs j 
ON e.`job_id` = j.`job_id`
WHERE last_name LIKE '%e%';
#2.非等值连接
#查询员工的工资级别
SELECT grade_levle FROM employees e
JOIN job_grades j
ON e.salary BETWEEN j.`lowest_sal` AND j.`highest_sal`;
#3.自连接
#查询员工的名字、上级的名字
SELECT 
  e.last_name,
  d.last_name 
FROM
  employees e 
  JOIN employees d 
    ON e.`manager_id` = d.`employee_id` ;





/*
  外连接
  特点：
   1.外连接的查询结果为主表中的所有记录
   如果从表中有和他匹配的，则显示匹配值
   如果没有则显示null
   外连接查询结果 = 内连接查询结果+主表中有而从表中没有的记录
   2.左外连接 left join 左边的是主表
     右外连接 right join 右边的是主表
     全外连接 = 内连接查询结果+表一中有但表二中没有的+表二中有表一中没有的
*/
#查询男朋友不在男神表的女神名
SELECT 
  b.name,
  bo.* 
FROM
  beauty b 
  LEFT OUTER JOIN boys bo 
    ON b.`boyfriend_id` = bo.`id` 
WHERE bo.`id` IS NULL ;


#交叉连接
SELECT 
  b.*,
  bo.* 
FROM
  beauty b 
  CROSS JOIN boys bo ;

