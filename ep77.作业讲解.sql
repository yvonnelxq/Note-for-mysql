#1.显示所有员工的姓名，部门号和部门名称
SELECT last_name,e.department_id,`department_name`
FROM employees e,departments d
WHERE e.department_id=d.`department_id`;

#2.查询90号部门员工的job_id和90号部门的location_id
SELECT e.job_id,e.`department_id`,l.location_id
FROM employees e,locations l
WHERE e.department_id=90;

#3.选择所有有奖金的员工的last_name,department_name,location_id,city
SELECT e.last_name,d.department_name,d.location_id,l.city
FROM employees e,departments d,locations l
WHERE d.`location_id`=l.`location_id`
AND e.`department_id`=d.`department_id`
AND e.commission_pct IS NOT NULL;

#4.选择city在Toronto工作的员工的last_name,job_id,department_id,department_name
SELECT e.last_name,e.job_id,e.department_id,d.department_name
FROM employees e,departments d,locations l
WHERE l.location_id=d.location_id
AND e.`department_id`=d.`department_id`
AND city='Toronto';



