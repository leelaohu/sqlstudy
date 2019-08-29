#进阶3：排序查询
/*
   语法：
   select 查询列表 from 表【where 筛选条件】order by 【排序列表】【asc|desc】
	asc 从低到高 升序
	desc 从高到低 降序
	order by 后可以加 单个字段，多个字段，表达式，函数，别名
	order by字句放在查询语句的最后面，limit字句除外
*/
#案例一：
·# 查询员工信息，要求工资从高到低排序
 SELECT * FROM employees ORDER BY salary DESC;
 #-----------------
 # 查询员工信息，要求工资从低到高排序
  SELECT * FROM employees ORDER BY salary ASC;
  
  
#案例2  查询部门编号大于等于90的员工信息，按入职先后进行排序
  SELECT * FROM employees WHERE department_id>=90 ORDER BY hiredate ASC;
  
#案例3 按年薪的高低显示员公的信息和年薪【按表达式排序】
  SELECT *,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
  FROM employees
  ORDER BY
  salary*12*(1+IFNULL(commission_pct,0)) DESC;
#------------------------支持别名
SELECT *,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
  FROM employees
  ORDER BY
  年薪 DESC;
#案例4 按姓名的长度显示员工的姓名和工资【按函数排序】 

SELECT LENGTH(last_name) 字节长度,last_name,salary FROM employees ORDER BY LENGTH(last_name);
 
#案例5  查询员工信息先按工资升序再按员工编号降序

SELECT * FROM employees ORDER BY salary,employee_id DESC;














