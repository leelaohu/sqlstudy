#进阶2  条件查询

/*
	select 查询列表 from 表名 where 筛选条件	
	
分类
	1.按条件表达式查询
		简单条件运算符：> < = != <> >= <=
	2.按逻辑表达式筛选
		用于连接条件表达式
		逻辑运算符 ： && || !   and or not
	3.模糊查询
		like
		between and
		in
		is null
  */
 #1.按条件表达式筛选
   #ex：查询工资大于12000的员工
  SELECT * FROM employees WHERE salary>12000
  #ex：查询部门编号不等于90号的员工名和部门编号
  SELECT
	last_name,department_id
  FROM 
	employees
  WHERE
	department_id<>90
  
   #1.按逻辑表达式筛选
#ex： 查询工资在10000到20000之间的员工名，工资以及奖金
  SELECT
	last_name,
	salary,
	commission_pct
  FROM
	employees
  WHERE
	salary>=10000 AND salary<=20000;		
  
 #ex： 查询部门编号不是在90-100之间，或者公资高于15000的员工信息
  
  SELECT
	* 
  FROM 
	employees
  WHERE
	NOT (department_id>=90 AND department_id<=110)orsalary>15000
	
#--------------------------------------------------------------------------
  
  SELECT
	* 
  FROM 
	employees
  WHERE
	department_id<90 OR department_id>110
	OR
	salary>15000	
	
#3.模糊查询	
 #like,between and,in,is null,is not null
	#like搭配通配符使用
	#  %  任意多个字符，包括0
	#  _  任意单个字符
 #ex： 查询名字中带有a的员工info
 
 
 SELECT * FROM employees WHERE last_name LIKE '%a%';
 
 #ex 查询员工名中第3个字符为n的第5个字符为l的员工名
 
 SELECT last_name FROM employees WHERE last_name LIKE '__n_l%';
 
 #ex 查询员工名中第2个字符为_的员工名
 
 SELECT last_name FROM employees WHERE last_name LIKE '_\_%';
 #--------------------------
 SELECT last_name FROM employees WHERE last_name LIKE '_$_%' ESCAPE '$';
 
 
 
 #between and
 #使用他可以提高语句的简洁度
 #包含两个临界值，并且不能调换顺序
 
  #ex 查询员工编号在100-120之间的员工信息
  
  SELECT * FROM employees WHERE employee_id>=100 AND employee_id<=120;
 #---------------------------------------------------------
 
 SELECT * FROM employees WHERE employee_id BETWEEN 100 AND 120;
 
 
 #in
  /*
     判断某字段的值是否属于in列表中的某一项
     使用in提高语句简洁度
     in列表中的数据类型必须统一或兼容
     不能使用通配符  
  */
 
 
  #查询员工的工种编号是IT_PROT,AD_VP,AD_PRES中的一个员工名和工种编号
 
 SELECT last_name,job_id FROM employees WHERE job_id='IT_PROT' OR job_id='AD_VP' OR job_id='AD_PRES';
#-------------------------------------------- 
 SELECT last_name,job_id FROM employees WHERE job_id IN ( 'IT_PROT','AD_VP','AD_PRES' );
 
 
 
 /*
	is null
		
	=,<>不能用于判断null值
	is null ,is not null 可以判断
 */
 #查询没有奖金的员工名和奖金率
 
 SELECT last_name,commission_pct FROM employees WHERE commission_pct IS NULL;

 #SELECT last_name,salary FROM employees WHERE salary IS 12000
 
 # 安全等于 <=>
 
 SELECT last_name,salary FROM employees WHERE salary <=> 12000;
 
 #is null pk <=>
 
  #is null  仅仅可以判断null值  可读性较高（推荐）
  #<=>  可以判断null值也可以判断普通数值 可读性较低
 
 
 # 查询员工号为176的员工姓名和部门号和年薪``
 SELECT 
	last_name,
	employee_id,
	department_id,
	salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
 FROM
	employees
 WHERE
	employee_id = 176;	
	
	
 
 
 
 
 
 
  