#进阶1：基础查询
/*
语法:
select 查询列表
from 表名;
特点:1.查询列表可以是：表中的字段、常量值、表达式、函数
2.查询的结果是一个虚拟的表格
*/

USE myemployees;
#1.查询表中的单个字段
SELECT last_name FROM employees;
#2.查询表中的单个字段
SELECT last_name,salary,email FROM employees;
#3.查询表中的所有字段
SELECT * FROM employees;
#格式化 选中想查询字段后按F12
#执行查询 选中想查询字段后按F9

#4.查询常量值
SELECT 100;
SELECT 'john';

#5.查询表达式
SELECT 100*98;

#6.查询函数
SELECT VERSION();

#7.起别名
/*①便于理解
 ②如果要查询的字段有重名的情况，使用别名可以区别开来*/
 #方式一：
SELECT 100%98 AS 结果;
SELECT last_name AS 姓,first_name AS 名 FROM employees;

#方式二：
SELECT last_name 姓,first_name 名 FROM employees;

#案例：查询salary，显示结果为 out put
SELECT salary AS "out put" FROM employees

#8.去重
#案例：查询员工表中涉及到的所有的部门编号
SELECT DISTINCT department_id FROM employees;

#9.+号的作用
/*
仅仅只有一个功能：运算符
select 100+90;两个操作数为数值型，则做加法运算
select ‘123’+90;有其中一方为字符型，试图将字符型数值转换为数值型
                如果转换成功，则继续做加法运算         结果为213
select ‘jhon’+90;如果转换失败，则将字符型数值转换成0   结果为90  
select null+10;只要其中一方为null，则拼接结果肯定为null   
*/
#案例：查询员工名和姓连接成一个字段，并显示为 姓名
SELECT CONCAT(last_name,first_name) AS 姓名 FROM employees;
