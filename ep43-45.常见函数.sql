#进阶4：常见函数
/*
将我们的一组逻辑语句封装在方法体中，对外暴露方法名
好处：1.隐藏了实现细节
      2.提高代码的重用性
调用：select 函数名(实参列表) 【from 表】;
特点：①函数名叫什么
      ②函数功能 干什么
分类：
      1.单行函数 做处理
               concat、length、infnull等
      2.分组函数 做统计、聚合           
*/
#单行函数
#A.字符函数
#length 获取参数值的字节
SELECT LENGTH('陈立农LEO');
#结果为12，一个字母为一个字节，一个汉字为3个字节

#查看字符集
SHOW VARIABLES LIKE '%char%';

#B.拼接字符
SELECT CONCAT(last_name,' ',first_name) 姓名 FROM employees;

#C.upper大写、lower小写
SELECT UPPER('jhon');
#示例：将姓变大写、名变小写，然后拼接
SELECT CONCAT(UPPER(last_name),' ',LOWER(first_name)) FROM employees;

#D.substr、substring截取字符串
#注意：索引从1开始
SELECT SUBSTR('夏日滋味优优优',5) 结果;
#截取从指定索引开始后面所有的字符
#得到 优优优

SELECT SUBSTR('夏日滋味优优优',1,4)
#截取从指定索引开始后面的几个长度字符
#得到 夏日滋味

#案例：姓名中首字符大写，其他字符小写，然后用_拼接，显示出来
SELECT CONCAT(CONCAT(UPPER(SUBSTR(last_name,1,1)),LOWER(SUBSTR(last_name,2))),'_',LOWER(SUBSTR(first_name,1)))FROM employees;

#E.instr 返回子串第一次出现的索引，如果找不到返回0
SELECT INSTR('夏日滋味','滋味') ;

#F.trim
SELECT LENGTH( TRIM('     夏日滋味   '));
#去空格
SELECT TRIM('a' FROM'aaaaaaaa夏日aaaa滋味aaaaaaaa');
#去前后

#G.lpad 用指定的字符左填充指定长度
SELECT LPAD('夏日滋味',10,'优');
#优优优优优优夏日滋味
SELECT LPAD('夏日滋味',3,'优'); 
#夏日滋

#H.Rpad 用指定的字符右填充指定长度
SELECT RPAD('夏日滋味',10,'优');
#夏日滋味优优优优优优

#Replace 替换
SELECT REPLACE('夏日滋味优优优','优优优',' ');
#夏日滋味 