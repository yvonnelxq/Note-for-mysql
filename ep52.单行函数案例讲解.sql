#1.显示系统时间(注：日期+时间）
SELECT NOW();
#2.查询员工号，姓名，工资，以及工资提高百分之20%后的结果(new salary)
SELECT employee_id,last_name,salary,salary*1.2 `new salary`
FROM employees;
#3.将员工的姓名按首字母排序，并写出姓名的长度（length）
SELECT LENGTH(last_name),last_name FROM employees ORDER BY SUBSTR(last_name,1,1) ASC; 
#4.做一个查询，产生下面的结果
SELECT CONCAT(last_name,' ','earns',' ',salary,' ','monthly but wants',salary*3) `dream salary`
FROM employees;
#5.使用case-when，按照下面的条件:
/*job              grade
  AD_PRES          A
  ST_MAN           B
  IT_PROG          C
  */
  SELECT job_id job,
  CASE job_id
  
  WHEN 'AD_PRES' THEN 'A' 
  WHEN 'ST_MAN' THEN 'B' 
  WHEN 'IT_PROG' THEN 'C ' 
  ELSE 'D'
  END AS grade
  FROM employees;