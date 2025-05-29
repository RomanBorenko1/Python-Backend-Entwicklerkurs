-- 1. Функция для расчета площади круга


DELIMITER $$
CREATE FUNCTION f_area_circle(x DOUBLE)
RETURNS DOUBLE
BEGIN
	RETURN 3.1416 * x * x;
END $$
DELIMITER ;

select f_area_circle(2);


-- 2 Функция для расчета гипотенузы треугольника

DELIMITER $$
CREATE FUNCTION f_hypotenuse_triangle(a DOUBLE, b DOUBLE)
RETURNS DOUBLE
BEGIN
	RETURN SQRT(POWER(a, 2) + POWER(b, 2));
END $$
DELIMITER ;

select f_hypotenuse_triangle(3, 4);

