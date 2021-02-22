#二、数学函数

#round 四舍五入
SELECT ROUND(1.65);    #四舍五入
SELECT ROUND(1.562,2); #小数点后两位 1.56

#ceil 向上取整,返回>=该参数的最小整数
SELECT CEIL(1.002);  #2
SELECT CEIL(-1.002); #-1

#floor 向下取整，返回<=该参数的最小整数
SELECT FLOOR(1.002);  #1

#truncate 截断 保留小数点后面几位，不管后面几位都截断
SELECT TRUNCATE(1.65990,1);

#mod取余
/*
mod(a,b):a-a/b*b
select mod(-10,-3);#-1
-10-(-10)/(-3)*(-3)=-10-3*(-3)=-10+9=-1
*/
SELECT MOD(2.5,2);
#相当于
SELECT 2.5%2;

