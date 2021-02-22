#进阶3：排序查询

/*
引入
SElect * from employees;
语法
select 查询列表   ③
from   表         ①
【where 筛选条件】②
order by 排序列表 【asc升序|desc降序】如果不写，默认是升序 ④
特点
1.order by 句中可以支持单个字段、多个字段、表达式、函数、别名
2.order by 子句一般是放在查询语句的最后面，limit子句除外
*/

#案例1:查询员工信息，要求工资从高到低排序
SELECT * FROM employees ORDER BY salary DESC;

#案例2:查询部门编号大于等于90的员工信息，按入职时间先后排序【添加筛选条件】
SELECT * FROM employees WHERE `department_id`>=90 ORDER BY `hiredate`;

#案例3：按年薪的高低显示员工的信息和年薪【按别名排序】
SELECT *,salary*12*(1+IFNULL(commission_pct,0))AS 年薪 FROM employees ORDER BY 年薪;

#案例4：按姓名的长度显示员工的姓名和工资【按函数排序】
SELECT last_name,salary FROM employees ORDER BY LENGTH(last_name);

#案例5：查询员工信息，先按工资升序，再按员工编号排序 【按多个字段排序】
SELECT * FROM employees ORDER BY salary ASC ,`employee_id` DESC;
#工资有一样的话，再按员工编号排

