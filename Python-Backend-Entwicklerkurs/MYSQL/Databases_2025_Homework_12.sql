 #1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника

 DELIMITER $$
 CREATE PROCEDURE p_id_emp(in id_emp int)
 BEGIN
	SELECT department_id 	
    FROM employees 
    WHERE id = id_emp;
 END $$
  DELIMITER ;
 
 
 
#2 Создайте хранимую процедуру get_employee_age, которая принимает 
#id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.

DELIMITER $$
CREATE PROCEDURE get_employee_age(IN emp_id INT, OUT age_emp INT)
BEGIN
	SELECT age INTO age_emp
    FROM employees 
    WHERE id = emp_id; 
END $$
DELIMITER ;



#3 Создайте хранимую процедуру increase_salary, 
#которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.
DELIMITER $$
CREATE PROCEDURE increase_salary(INOUT salary_emp DECIMAL(10,2)) 
BEGIN
	SET salary_emp = salary_emp * 0.9;
END $$
DELIMITER ;


