#自连接
#案例：查询员工名和上级的名称
SELECT 员工表.employee_id,员工表.last_name 员工名,员工表.manager_id,领导表.last_name 领导名
FROM employees 员工表,employees 领导表
WHERE 员工表.`manager_id`=领导表.`employee_id`;
