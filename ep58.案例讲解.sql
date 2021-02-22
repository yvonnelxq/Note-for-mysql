#1.查询公司员工工资的最大值、最小值、平均值、总和
SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary) FROM employees;
#2.查询员工表中的最大入职时间和最小入职时间的相差天数（DATEDIFF)
SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) FROM employees;
#3.查询部门编号为90的员工个数
SELECT COUNT(*) FROM employees WHERE department_id = 90;