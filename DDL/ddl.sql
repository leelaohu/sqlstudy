/*
   数据库定义语言
   库和表的管理
   
一、库的管理
创建，修改，删除
二、表的管理
创建，修改，删除

创建：create
删除：drop
修改：alter

*/

#一、库的管理
#1、库的创建
/*
	语法：
	create databases [if not exists] 库名;
*/

CREATE DATABASE IF NOT EXISTS books;

#库的修改
#更改库的字符集
ALTER DATABASE books CHARACTER SET gbk;

#库的删除
DROP DATABASE IF EXISTS books;



/*
   二、表的管理
   1.表的创建
   语法：create table 表名(
	列名 列的类型 【(长度) 约束】,
	列名 列的类型 【(长度) 约束】,
	...
	列名 列的类型 【(长度) 约束】
	
   )

*/
#创建表book
CREATE TABLE book(
	id INT,#编号
	bName VARCHAR(20), #图书名
	price DOUBLE, #价格
	authorId INT, #作者
	publishDate DATETIME #出版日期
);

DESC book;
CREATE TABLE author(
	id INT,
	au_name VARCHAR(20),
	nation VARCHAR(10)
);

DESC author;

#表的修改
#alter table 表名 add|drop|modify|change colum 列名 [列类型，约束];
#① 修改列名
ALTER TABLE book CHANGE COLUMN publishDate pubDate DATETIME;
#② 修改列的类型或约束
ALTER TABLE book MODIFY COLUMN pubDate TIMESTAMP;
#③ 添加新列
ALTER TABLE author ADD COLUMN annual DOUBLE;
#④ 删除列
ALTER TABLE author DROP annual;
#⑤  修改表名
ALTER TABLE author RENAME TO book_author;
DESC book_author;
#表的删除
DROP TABLE book_author;
SHOW TABLES;




#表的复制
INSERT INTO author VALUES(1,'莫言','中国'),
(2,'村上春树','日本'),
(3,'俄罗斯','列夫·托尔斯泰'),
(4,'鲁迅','中国');

SELECT * FROM author;
#仅仅复制表的结构
CREATE TABLE copy LIKE author;
#复制表的结构+数据
CREATE TABLE copy2 SELECT * FROM author;
#只复制部分数据
CREATE TABLE copy3 SELECT id,au_name FROM author WHERE nation = '中国';
#仅仅复制某些字段
CREATE TABLE copy4 SELECT id,au_name FROM author WHERE 0;