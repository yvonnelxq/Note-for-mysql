#进阶6：连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询

      
*/
SELECT * FROM beauty;
SELECT * FROM boys;
SELECT `name`,boyName FROM beauty,boys;

/*笛卡尔集的错误情况: 假如表1有m行，表2有n行，结果m*n行

select count(*) from beauty;
假设输出12行
select count(*) from boys;
假设输出4行
最终输出结果：12*4=48行

发生原因：没有有效的连接条件

分类：按年代分类： sql 92标准 仅仅支持内连接
                   sql 99标准【推荐】 支持内连接+外连接（左外和右外）+交叉连接
      按功能分类： 内连接    
                      等值连接
                      非等值连接
                      自连接
                   外连接
                     左外连接
                     右外连接
                     全外连接
                   交叉连接
*/

#一、sql 92标准
#1.等值连接
/*①多等值连接的结果为多表的交集部分
  ②n表连接，至少需要n-1个连接条件
  ③多表的顺序没有要求
  ④一般需要为表起别名
  ⑤可以搭配前面介绍的所有子句使用 必须排序、分组、筛选
/*
#案例1：查询女神名对应的男神名
SELECT `name`,boyName 
FROM beauty,boys
WHERE beauty.boyfriend_id=boys.id;

#案例2：查询员工名和对应的部门名
SELECT last_name,department_name
FROM employees,departments
WHERE employees.`department_id`=departments.`department_id`;

#2.为表起别名
/*①提高语句的简洁度
  ②区别多个重名字段
  ③两个表的顺序可以调换
  
  注意：如果为表起了别名，则查询的字段就不能使用原来的表名去限定*/
#查询员工名、工种号、工种名
SELECT `last_name`,e.job_id,`job_title`
FROM `employees` e,`jobs` j
WHERE e.`job_id`=j.`job_id`;
#job_id不能有歧义

#3.可以加筛选
#案例1：查询有奖金的员工名和部门名
SELECT last_name,`department_name`
FROM employees,departments
WHERE departments.`department_id`= employees.`department_id`
AND commission_pct IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名
SELECT `department_name`,`city`
FROM `departments` d,`locations` l
WHERE d.`location_id`=l.`location_id`
AND `city` LIKE '_o%';

#4.可以加分组

#案例1：查询每个城市的部门个数
SELECT COUNT(*)个数,city
FROM departments d,locations l
WHERE d.`location_id`=l.`location_id`
GROUP BY city;

#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name,d.manager_id,MIN(salary)
FROM departments d,employees e
WHERE d.`department_id`=e.`department_id`
AND e.`commission_pct` IS NOT NULL
GROUP BY d.department_name;

#5.可以加排序
#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT j.job_title,COUNT(*) 员工个数
FROM jobs j,employees e
WHERE j.job_id=e.`job_id`
GROUP BY j.job_title
ORDER BY 员工个数 DESC;

#6.可以实现三表连接？

#案例：查询员工名、部门名和所在的城市
SELECT last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.`department_id`=d.`department_id` AND d.`location_id`= l.`location_id`;
