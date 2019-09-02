# 进阶8 分页查询   （git  test没用学习git）
/*
  应用场景当要显示的数据，一夜显示不全，需要分页提交sql请求
  语法:
	select 查询条件
	from 表
	【连接类型】 join 表2
	on 连接条件
	where 筛选条件
	group by 分组字段
	having  分组后的筛选
	order by 排序
	limit offset,size;
	offset 需要显示条目的起始索引（从0开始）
	size 要显示的条目个数
	
   特点：
       1.limit 放在查询语句的最后
       2.公式
       limit (page-1)*size,size;
*/
#ex1查询前五条员工信息
SELECT * FROM employees LIMIT 0,5;
#查询第11~25条的
SELECT * FROM employees LIMIT 10,15;
#有奖金的员工信息，并且工资较高的前十名显示
SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY salary DESC LIMIT 10;