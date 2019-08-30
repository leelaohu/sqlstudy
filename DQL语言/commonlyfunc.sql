#进阶4 常用函数
/*
   概念：将一组逻辑语句封装在方法体中，对外暴露方法名
   好处：隐藏实现细节，提高代码的重用性
   调用 ：select 函数名(实参列表) 【form表】
   特点：叫什么，干什么用的
   分类：
   单行函数
      如：concat,length,ifnull等
   分组函数
     功能：做统计用，又称为统计函数，聚合函数，组函数
     
     
     常见函数：
       字符函数：
       length
       concat
       substr
       instr
       trim
       upper
       lower
       replace
       lpad
       rpad
       数学函数：
       round
       ceil
       floor
       turncate
       mod
       日期函数
       now
       curtime
       curdate
       year
       month
       monthname
       date
       hour
       minute
       second
       str_to_date
       date_format
       其他函数：
       version
       database
       user
       控制函数：
       if
       case      
*/
#一. 字符函数
#length 获取参数的字节个数
SELECT LENGTH('张三丰hahaha');
SHOW VARIABLES LIKE '%char%';

#concat拼接字符串
SELECT CONCAT(last_name,'_',first_name) FROM employees;
#upper，lower
SELECT UPPER('john');
SELECT LOWER('joHn');
#EX1 将姓大写名小写然后拼接
SELECT CONCAT(UPPER(last_name),'_',LOWER(first_name)) 姓名 FROM employees;

# substr,substring 
	#注意索引从1开始
#2个参数 截取从指定索引处到后边的所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',7) out_put;
#3个参数 截取从指定索引处到指定索引出的所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',1,3) out_put;
#ex：姓名中首字母大写，其他字母小写然后用_拼接，显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),'_',LOWER(SUBSTR(last_name,2))) FROM employees;

#instr 返回字符串第一次出现的索引，如果没有返回0
SELECT INSTR('杨不会爱上了殷六侠','殷六侠') out_put;


#trim
SELECT TRIM('  张翠三  ') out_put;
SELECT TRIM('a' FROM 'aaaaaaaaaa张翠三aaaaaaaaaaaaaaaa') out_put;

#lpad 用指定的字符实现左填充指定长度
SELECT LPAD('殷素素',10,'*') out_put;

#rpad 用指定的字符实现右填充指定长度
SELECT RPAD('殷素素',12,'ab') out_put;

#replace
SELECT REPLACE('张无忌爱上了周芷若','周芷若','赵敏') out_put;




#二、 数学函数

#round四舍五入
 SELECT ROUND(1.4) out_put;
 
 #保留几位小数
 SELECT ROUND(1.467,2) out_put;

#ceil向上取整 返回一个大于等于该参数的最小整数
 SELECT CEIL(1.002) out_put;
#floor向上取整 返回一个小于等于该参数的最大整数
 SELECT FLOOR(1.002) out_put;


#truncate 截断小数点后保留几位
SELECT TRUNCATE(1.65,1);

#mod取余; a-a/b*b
SELECT MOD(10,3);
SELECT 10%3;


#三、日期函数
   
#now 返回系统当前的日期+时间
SELECT NOW();   
  
#curdate 返回系统当前的日期
SELECT CURDATE(); 
#curtime 返回系统当前的时间
SELECT CURTIME(); 

#获取指定的部分年、月、日、小时、分钟、秒
SELECT YEAR(NOW()) 年;
SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月;
SELECT DATE(NOW()) 日;
SELECT HOUR(NOW()) 时;
SELECT MINUTE(NOW()) 分;
SELECT SECOND(NOW()) 秒;

#str_to_date 将字符通过指定的格式转化为日期

SELECT STR_TO_DATE('1998-5-7','%Y-%c-%d');

#查询入职日期为1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';
SELECT STR_TO_DATE('4-3 1992','%m-%d %Y');

SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%m-%d %Y');

#date_format 将日期通过指定的格式转化为字符

SELECT DATE_FORMAT('1998-05-07','%d-%m-%Y');

#查询有奖金的员工名和入职日期（xx月/xx日 xx年）
SELECT last_name,DATE_FORMAT(hiredate,'%m月/%d日 %Y年') FROM employees WHERE NOT ISNULL(commission_pct);

#四、其他函数
USE myemployees;
SELECT VERSION();
SELECT DATABASE();
SELECT USER();

#五、流程控制函数
#1.if函数：if else的效果

SELECT IF(10<5,'大','小');

SELECT last_name,commission_pct,IF(NOT ISNULL(commission_pct),'有奖金，哈哈','没奖金，嘻嘻') out_put FROM employees;

#2.case函数的使用1 相当于switch case 的效果
/*
    switch(要判断的常量或表达式){
	case 常量1：语句1;break;
	...
	default : 语句;break
    }
    
    
    mysql中
      case 要判断的常量或表达式{
	when 常量1 then 要显示的值1或语句1;
	when 常量2 then 要显示的值1或语句2;
	...
	else : 要显示的值或语句n
    }
*/
/*
	查询员工的工资，要求
	部门号=30，显示的工资为1.1倍
	部门号=40，显示的工资为1.2倍
	部门号=50，显示的工资为1.3倍
	其他的显示工资为原工资
*/

SELECT salary 原始工资,department_id 部门,
    CASE department_id
    WHEN 30 THEN salary*1.1
    WHEN 40 THEN salary*1.2
    WHEN 50 THEN salary*1.3
    ELSE  salary
    END
    AS 新工资
FROM employees;

#2.case函数的使用2 相当于多重if
/*
   if(条件1){
	语句1
   }else if(条件2){
	语句2
   }
   ...
   else{
	语句n
   }
   
   mysql中：
   case 
   when 条件1 then 要显示的值1或语句1
   when 条件2 then 要显示的值1或语句2
   ...
   else 要显示的值n或语句n
   end
*/
/* 
    如果工资>20000,显示A级别
    如果工资>15000,显示A级别
    如果工资>10000,显示A级别
    否则显示D级别
*/
SELECT salary,
	CASE
	WHEN salary>20000 THEN  'A级别'
	WHEN salary>15000 THEN  'B级别'
	WHEN salary>10000 THEN  'C级别'
	ELSE 'D级别'
	END
	AS 级别
FROM
	employees;
















