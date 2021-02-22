#二、分组函数
/*功能：用作统计使用，又称为聚合函数或统计函数或组函数
  分类：
  sum求和、avg平均值、max最大值、min最小值、count计算个数
  特点：
  1.sum、avg一般用于处理数值
    max、min、count可以处理任何类型
  2.以上分组函数都忽略null值
  3.可以和distinct搭配实现去重的运算
  4.单独介绍count
    一般使用count(*)用作统计行数
  5.和分组函数一同查询的字段要求是group by后的字段
*/
#简单使用
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT SUM(salary) 和, ROUND(AVG(salary),2) 平均,MIN(salary) 最低,MAX(salary) 最高,COUNT(salary) 个数 FROM employees;

#2.参数类型支持哪些类型
SELECT SUM(last_name),AVG(last_name) FROM employees;
SELECT SUM(hiredate),AVG(hiredate) FROM employees;
SELECT MAX(last_name),MIN(last_name),COUNT(last_name) FROM employees;
SELECT MAX(hiredate),MIN(hiredate) FROM employees;
SELECT COUNT(hiredate) FROM employees;
SELECT COUNT(commission_pct) FROM employees;

#3.是否忽略Null
SELECT SUM(commission_pct) FROM employees;   #sum有忽略
SELECT MAX(commission_pct) FROM employees;   #有忽略
SELECT MIN(commission_pct) FROM employees;   #有忽略
SELECT COUNT(commission_pct) FROM employees; #count计算非空的值的个数 有忽略

SELECT SUM(commission_pct),AVG(commission_pct),SUM(commission_pct)/35,SUM(commission_pct)/107 FROM employees;
#avg有忽略

#4.和distinct搭配
SELECT SUM(salary),SUM(DISTINCT salary) FROM employees;
SELECT COUNT(salary),COUNT(DISTINCT salary)FROM employees;

#5.count函数详细介绍
SELECT COUNT(salary) FROM employees;
SELECT COUNT(*) FROM employees; #任何一行 只要有一个字段不为Null就统计上
SELECT COUNT(1) FROM employees; #假装每一行都放1，统计1的个数

/*效率：
MYISAM存储引擎下，COUNT(*) 效率高
INNODB存储引擎下，COUNT(*) 和count(1)差不多，比count(字段)要高一点，因为计算字段需要判断是否为null值
*/

#6.和分组函数一同查询的字段有限制
#avg()一个值
#employee_id是107个值

