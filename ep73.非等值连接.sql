#2.非等值连接


CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  INT,
 highest_sal INT);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

#案例1：查询员工的工资和工资级别
SELECT * FROM job_grades;

SELECT salary,employee_id FROM employees;

SELECT salary,grade_level 
FROM employees e,job_grades g
WHERE e.`salary` BETWEEN lowest_sal AND highest_sal;
