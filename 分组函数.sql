#二、分组函数
/*
  功能：用作统计使用，又称为聚合函数或者统计函数或组函数
  sum 求和 avg 平均值 max最大值 min 最小值 count 计算个数
*/
# 简单使用
 SELECT SUM(salary) FROM employees;
 SELECT AVG(salary) FROM employees;
 SELECT MAX(salary) FROM employees;
 SELECT MIN(salary) FROM employees;
 SELECT COUNT(salary) FROM employees;
 SELECT SUM(salary) 和,
	 ROUND(AVG(salary),2) 平均值,
	 MIN(salary) 最小值,
	 MAX(salary) 最大值,
	 COUNT(salary) 数量
	 FROM employees;
	 
#支持哪些类型
/*
   1.sum,avg一般只支持数值类型，
     min,max,count 印版可以处理任何类型
   2.是否忽略null 值
   
   以上分组函数都忽略null值
     
   3.可以和distinc搭配实现去重的运算 
   
   4.单独介绍count函数
   
   效率：
   myisam存储引擎下count(*)效率最高
   innodb存储引擎下count(*)和count(1)效率差不多，但比count(字段)要高一些
       
   一般使用count(*)统计行数
   5.和分组函数一同查询的字段有限制
   和分组函数一同查询的字段要求是group by后的字段
*/
SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;

#查询员工表中最大入职时间和最小入职时间的相差天数
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) FROM employees;











