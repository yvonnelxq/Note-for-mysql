#流程控制函数
#1.if函数:if else的效果
SELECT IF(10>5,'大','小');

SELECT last_name,commission_pct,IF(commission_pct IS NULL,'没奖金','有奖金') 备注 FROM employees;

#2.case函数的使用一： switch case的效果
/*
java中：
switch(变量或表达式）:
       case 常量1 : 语句1; break;
       ...
       default:语句n;break;
       
mysql中：
CASE 要判断的字段或者表达式
WHEN 常量1 THEN 要显示的值1或'语句1'
WHEN 常量2 THEN 要显示的值1或'语句2'
...
ELSE 要显示的值n或'语句n';
END
*/
#案例：查询员工的工资，要求
/*部门号=30，显示的工资为1.1倍
  部门号=40，显示的工资为1.2倍
  部门号=50，显示的工资为1.3倍
  其他部门，显示的工资为原工资
*/
SELECT salary 原始工资,department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END AS 新工资
FROM employees;


#3.case函数使用二：类似于 多重if
 /*case 
when 条件1 then 要显示的值1或 语句1
WHEN 条件2 THEN 要显示的值2或 语句2
...
else 要显示的值n或 语句n
end
*/
#案例：查询员工的工资情况
 /*如果工资>20000,显示A级别
  如果工资>15000,显示B级别
  如果工资>10000，显示C级别
  否则，显示D级别
*/
SELECT salary,
CASE`
when salary>20000 then 'Grade A'
WHEN salary>15000 THEN 'Grade B'
WHEN salary>10000 THEN 'Grade C'
else 'Grade D'
End as 工资级别
from employees;
