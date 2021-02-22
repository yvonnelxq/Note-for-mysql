#进阶5：分组查询

#分组数据：GROUP BY子句语法 可以使用Group by子句将表中的数据分成若干组
/*select        column,group_function(column)
                分组函数，列（要求出现在group by的后面）
  from          table
  [where        condition]
  [group by     group_by_expression]
   HAVING       分组后筛选;
  [order by     column]
  
   
  明确:where 一定放在 from 后面
  注意：查询列表比较特殊，要求是分组函数和group by 后出现的字段
  
  特点：1.分组查询中的筛选条件分为两类
                          数据源                 位置                     关键字
        ①分组前筛选       原始表                 group by子句的前面       where
        ②分组后筛选       分组后的结果集         group by子句的后面       having
        
        分组函数做条件肯定是放在having子句中
        能用分组前筛选的优先考虑使用分组前筛选
        
        2.GROUP BY子句支持单个字段或多个字段分组，多字段之间用逗号隔开，表达式或函数用得较少
        3.也可以添加排序，排序放在整个分组查询最后
*/
#引入：查询每个部门的平均工资
SELECT AVG(salary) FROM employees;

#按子句分组
#简单的分组查询
#案例1：查询每个工种的最高工资
SELECT MAX(salary),job_id
FROM employees
GROUP BY job_id;

#案例2：查询每个位置上的部门个数
SELECT COUNT(*),`location_id` 
FROM `departments`
GROUP BY `location_id`;

#添加筛选条件
#案例1：查询邮箱中包含a字符的，每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

#案例2:查询有奖金的每个领导手下员工的最高工资
SELECT MAX(salary),`manager_id`
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY `manager_id`;

#添加复杂的筛选条件/分组后的筛选
#案例1：查询哪个部门的员工个数>2

#①查询每个部门的员工个数
SELECT COUNT(*) AS 人数,`department_id`
FROM employees
GROUP BY `department_id`;

#②根据①的结果进行筛选，查询哪个部门的员工个数>2
  
SELECT COUNT(*) AS 人数,`department_id`
FROM employees
GROUP BY `department_id`
HAVING COUNT(*)>2;

#案例2：查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;

#案例3：查询领导编号>102的每个领导手下的最低工资>5000的领导编号是哪个，以及其最低工资
#①查询每个领导手下的最低工资>5000
SELECT MIN(salary),`manager_id`
FROM employees
WHERE `manager_id`>102
GROUP BY `manager_id`
HAVING MIN(salary)>5000;

#按表达式或函数分组
#案例：按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
#① 查询每个长度的员工个数
#② 添加筛选条件
SELECT COUNT(*) 员工个数,LENGTH(last_name) 姓名长度
FROM employees
GROUP BY 姓名长度
HAVING 员工个数>5;

/*在MYSQL中，GROUP BY和HAVING后面支持别名，而where不支持
  在Oracle中，都不支持*/
  
  #按多个字段分组
  #案例：查询每个部门每个工种的员工的平均工资
  SELECT AVG(salary),job_id,department_id
  FROM employees
  GROUP BY job_id,department_id;
  
  #添加排序
  #案例：查询每个部门每个工种的员工的平均工资，并且按工资的高低显示
  SELECT AVG(salary),job_id,department_id
  FROM employees
  GROUP BY job_id,department_id
  ORDER BY AVG(salary) DESC;