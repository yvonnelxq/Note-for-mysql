#进阶2：条件查询
/*
语法：select 查询列表 ③
      from 表名 ①
      where 筛选条件;②
      执行顺序为①②③
      
分类：
     1.按条件表达式筛选
     条件运算符：> 
                 < 
                 = 
                 != (不等）
                 <>(不等）
                 >=(大于等于）
                 <=
      2.按逻辑表达式筛选
      逻辑运算符：
                  作用：用于连接条件
                  & || ！
                  and or not
                  
      3.模糊查询
                  like 像
                     特点：
                          ①一般和通配符搭配使用 
                            通配符：
                                  a.%任意多个字符,包含0个字符
                                  b._任意单个字符
                  between and 
                             注意事项：
                                      ①提高语句简洁度
                                      ②包含临界值 相当于>=并<=
                                      ③不要调换临界值
                                      ④临界值类型一致或者可进行隐形转换
                  in
                    用于判断某字段的值是否属于in列表中的某一项
                    特点：
                         ①使用in做筛选比or提高语句简洁度
                         ②in列表的值类型要求统一或兼容（隐形转换）
                         ③不支持通配符
                  is null 
                         =或<>不能用于判断null值
                         is null 或 is not null可以判断null值
                  is not null                      
*/

#一、按条件表达式筛选
#案例1：查询工资>12000的员工信息
SELECT * FROM employees WHERE salary>12000;

#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT `last_name`,`first_name`,`department_id` FROM employees WHERE `department_id`<>90;

#二、按逻辑表达式筛选
#案例1：查询工资在10000到20000之间的员工名、工资以及奖金
SELECT `last_name`,`salary`,`commission_pct`
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
/*或者 WHERE salary>=10000 
      And   salary<=20000; 
*/  

#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT * FROM employees
WHERE `department_id`<90 AND `department_id`>110 OR salary>15000;
或
SELECT * FROM employees
WHERE NOT (`department_id`>90 AND `department_id`<110)OR salary>15000;

#三、模糊查询
#LIKE
#案例1：查询员工名中包含字符a的员工信息 字符型的值必须用单引号引起来 %代表通配符 任意一个字符
SELECT * FROM employees 
WHERE last_name LIKE '%a%';

#案例2：查询员工名中第三个字符为s,第五个字符为i的员工名和工资
SELECT 
      last_name,salary
FROM
     employees
WHERE
     last_name LIKE '__s_i%';     
     
#案例3：查询员工名中第二个字符为_的员工名
#1.使用 转义字符\，让后面的_不再为通配符
#2.使用ESCAPE指定字符转义
SELECT 
      last_name
FROM
     employees
WHERE
     last_name LIKE '_\_%';  
      
 #或者WHERE last_name LIKE '_$_%' ESCAPE '$;      
 
 #between and
 #案例1：查询员工编号在100到120之间的所有的员工信息
 SELECT 
      *
 FROM
     employees
 WHERE
     employee_id BETWEEN 100 AND 120; 
     
#in
#案例1：查询员工的工种编号IT_PROG、AD_PRES、AD_VP中的一个员工名和工种编号
SELECT 
      last_name,job_id
FROM
     employees
WHERE
     job_id IN ('IT_PROG','AD_PRES','AD_VP'); 
     
#is Null
#案例1：没有奖金的员工名和奖金率
SELECT last_name,commission_pct
FROM employees
WHERE commission_pct IS  NULL;

#安全等于  <=>
#即判断是否等于
#案例1：没有奖金的员工名和奖金率
SELECT last_name,commission_pct
FROM employees
WHERE commission_pct <=>  NULL;

#案例2：工资为12000的员工信息
SELECT 
      *
 FROM
     employees
 WHERE
     salary<=> 12000; 
     
 #is null pk <=>
 #is null仅仅可以判断Null值，可读性较高
 #<=>既可以判断null值，又可以判断普通的数值，可读性较低