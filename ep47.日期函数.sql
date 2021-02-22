#日期函数
#now 返回当前系统日期+时间
SELECT NOW();
#返回当前日期，不包含时间
SELECT CURDATE();
#返回当前时间，不包含日期
SELECT CURTIME();

#可以获取指定的部分，年、月、日、小时、分钟、秒
SELECT YEAR(NOW());
SELECT YEAR(hiredate) 年 FROM employees;

SELECT MONTHNAME(NOW()) 月;

#str_to_date 将日期格式的字符转换成指定格式的日期
#日期函数符号表见辅助图片
SELECT STR_TO_DATE('1999-8-24','%Y-%c-%d');

#查询入职日期为1992-4-3员工信息
SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');

#date_format 将日期转换成字符
SELECT DATE_FORMAT('1999-8-24','%Y年%c月%d日');
SELECT DATE_FORMAT(NOW(),'%Y年%c月%d日');

#查询有奖金的员工名和入职日期（xx月/xx日 xx年)
SELECT last_name,DATE_FORMAT(hiredate,'%m月/%d日 %y年') 
FROM employees
WHERE commission_pct IS NOT NULL;