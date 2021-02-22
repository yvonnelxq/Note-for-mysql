#一、显示员工表的最大工资，工资平均值
SELECT MAX(salary),AVG(salary) FROM employees;

#二、查询员工表的employee_id,job_id,last_name,按department_id降序，salary升序
SELECT employee_id,job_id,last_name
FROM employees
ORDER BY department_id DESC,salary ASC;

#三、查询员工表的job_id中包含a和e的，并且a在e的前面
SELECT job_id
FROM employees
WHERE job_id LIKE '%a%e%';

/*四、已知表student，里面有id(学号),name,gradeId(年级编号）
      已知表grade，里面有id(年级编号),name（年级名）
      已知表result,里面有id,score,studentNo(学号）
      要求查询有姓名、年级名、成绩*/
      
      SELECT s.name 姓名,g.name 年级名,r.score 成绩
      FROM student s,grade g,result r
      WHERE s.gradeId=g.id AND s.id=r.studentNo;
      
 #五、显示当前日期，以及去前后空格，截取字符串的函数
 SELECT NOW();
 
 SELECT TRIM(字符 FROM ' ');
 SELECT SUBSTR(str,从这个数开始截取后面全部);
 SELECT SUBSTR(str,从这个数开始截取,几个字符);
    