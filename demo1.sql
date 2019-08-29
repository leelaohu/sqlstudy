#查询没有奖金，且工资小于18000的salary，last_name

SELECT 
	last_name AS 姓名,salary AS 工资
 FROM 
	employees
 WHERE
	salary<18000 AND commission_pct IS NULL;
	
#查询employees表中，job_id 不为 'IT' 或者 工资为12000的员工信息

SELECT 
	*
FROM
	employees
WHERE
	job_id <> 'IT' OR salary = 12000;


#查看部门表departments的结构	
DESC departments;

#查看部门表departments涉及到哪些部门编号
SELECT DISTINCT location_id FROM departments;
