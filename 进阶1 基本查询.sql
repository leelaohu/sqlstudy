#进阶1：基础查询
/*
  select 查询列表 from 表名
  
  查询列表可以是：表中的字段、常量值、表达式、函数
  查询的结果是一个虚拟的表格
*/
USE myemployees;

#查询表中的单个字段
SELECT last_name FROM employees;
#查询表中的多个字段
SELECT 
  last_name,
  salary,
  email 
FROM
  employees ;

#查询表中的all字段
SELECT 
  * 
FROM
  employees ;

#notice  `` 用于区分字段名与关键字
#查询常量值
SELECT 100;
SELECT 'john';
#查询表达式
SELECT 100*98;

#查询函数
SELECT VERSION();
#起别名(1 便于理解，2 如果有相同的字段可以区分开来  as 可以省略)
#（如果字段中有关键字可以用双引号括起来单引号也可以）
SELECT 100%98 AS 结果;
SELECT last_name AS 姓,first_name AS 名 FROM employees;

#去重(字段前加  DISTINCT  )
#查询员工表中涉及到的部门编号
SELECT DISTINCT department_id FROM employees;

#+号的作用  只是运算符
#select 100+90 两个数都为数值型执行加法运算
#select ‘123’+90 其中有一个为字符串则试图转换为数值成功在进行加法运算
#select ‘john’+90 失败将其转化为0 再进行加法运算
#select null+90 有一个为null结果为null

# 员工名和员工姓连接在一起，并显示为姓名
SELECT CONCAT (last_name,'-',first_name) AS 姓名 FROM employees;
#显示表departments的结构并查询其中的全部数据
DESC departments;
SELECT * FROM departments;
#显示employees表中的全部job_id并不能重复
SELECT DISTINCT job_id FROM employees;
#显示出employees的全部列，各个列之间用,链接,列头显示成out_put

SELECT IFNULL(commission_pct,0) AS 奖金率,commission_pct FROM employees;
SELECT
	CONCAT(`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`job_id`,`salary`,IFNULL(`commission_pct`,0),`manager_id`,`department_id`,`hiredate`) AS out_put
FROM
	employees
















