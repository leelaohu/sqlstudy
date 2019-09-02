#DML语言
/*
   数据操作语言
   插入：insert
   修改：update
   删除：delete
*/
#一、插入语句
/*
  语法：
  1.  insert  into 表名(列名,...) values(值1,...)
  2.  insert  into set 列名=值，列名= 值 ...
*/
#1.插入的值的类型要与列的类型一致或兼容
SELECT * FROM beauty;
INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
	    VALUES(13,'鞠婧祎','女','1999-10-25','13552459936',NULL,1);
	    
#2.可以为null 的列如何插入值？
	#方式一
	SELECT * FROM beauty;
	INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
		    VALUES(13,'鞠婧祎','女','1999-10-25','13552459936',NULL,1);
	#方式二	 （类型也不写）   
	SELECT * FROM beauty;
	INSERT INTO beauty(id,NAME,sex,borndate,phone,boyfriend_id)
		    VALUES(14,'杨超越','女','1999-10-26','13552459937',2);
#3.列的顺序可以调换，但必须一一对应
#4.值的个数必须和列的个数一致
#5.可以省略列明，但是默认为所有列，而且列的顺序和表中的一只致


#两种方式pk
/*
	语法：
	  1.  INSERT  INTO 表名(列名,...) VALUES(值1,...)
	  2.  INSERT  INTO SET 列名=值，列名= 值 ...
	  
	  
	  1. 方式1支持多行插入,方式2不支持
	    INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
	    VALUES(13,'鞠婧祎','女','1999-10-25','13552459936',NULL,1),
	    (13,'鞠婧祎','女','1999-10-25','13552459936',NULL,1),
	    (13,'鞠婧祎','女','1999-10-25','13552459936',NULL,1)
	    ...;
	  2. 方式1支持子查询，方式二不支持
	    INSERT INTO beauty(id,NAME,sex)
	    select 26,'宋茜','11528635'
	  
*/

#二、修改语句
/*
	1.修改单表的记录
	  语法：
		update 表名 set 列=新值,列=新值，... where 筛选条件
	2.修改多表的记录
		sql92:
		update 表1 别名，表二 别名 set 列=值 where 连接条件 and 筛选条件
		sql99：
		update 表一 别名 inner|left,right join 表二 别名 on 连接条件 set 列=新值,列=新值，... where 筛选条件
	
*/
#修改id=2的男神的名字为张飞，魅力值为10
UPDATE boys SET boyName = '张飞',userCP = 10 whe`boyName`re id = 2;
#修改张无忌的女朋友的手机号为114
UPDATE boys bo INNER JOIN beauty b ON b.`boyfriend_id` = bo.`id` SET phone = '113' WHERE bo.`id` = 2;

#三、删除语句
/*
    方式一：
   1.单表的删除【☆】
	delete  from 表名 where 赛选条件
	1.单表的删除【☆】
    2.多表的删除
    
   方式二：truncate （只能清空表）
    turncate table 表名
    
   两种方式pk
      1.delete 可以加筛选条件，truncate 不可以
      2.turncate 效率高一点
      3.假如要删除的表中有自增长列，如果用delete删除后，再插入数据，自增列的值从断点开始
        turncate 从1开始
      4.truncate 删除不能回滚，delete可以
*/
SELECT * FROM boys;
DELETE FROM boys;
TRUNCATE TABLE boys;
INSERT INTO boys (boyName,userCP) VALUES ('张飞',100),('刘备',100),('关羽',100);


