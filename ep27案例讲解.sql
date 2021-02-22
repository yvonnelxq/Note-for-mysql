/*NUll跟任何数据拼接都得到NUll，为了让某些奖金率为NULL的数据显示为0
用INFULL方法，前面是要查询的参数，后面为查询得到NULL后替换的数据*/

SELECT 
      IFNULL(commission_pet,0) AS 奖金率,
      commission_pet
FROM
      employees;
      
      
#显示出表中employees的全部列，各个列之间用逗号连接，列头显示为out_put      
SELECT CONCAT(`last_name`,',',`first_name`,',',IFNULL(`commission_pct`,0)) AS out_put FROM employees;