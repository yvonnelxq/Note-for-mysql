#一、查询没有奖金，且工资小于18000的salary,last_name
SELECT salary,last_name FROM employees WHERE commission_pct IS NULL AND salary <18000;
#二、查询employees表中，job_id不为'IT'或者 工资为12000的员工信息
SELECT * FROM employees WHERE job_id NOT LIKE 'IT%' OR salary = 12000;
#三、查看部门department表的结果，查询结果如下
DESC departments;
#四、查询部门departments表中涉及到了哪些位置编号
SELECT DISTINCT location_id FROM departments;
#五、试问：select * from employees;和
SELECT * FROM employees WHERE commission_pct LIKE '%%' AND last_name LIKE '%%';
#结果是否一样，请说明原因
#如果判断的字段有null值则不一样