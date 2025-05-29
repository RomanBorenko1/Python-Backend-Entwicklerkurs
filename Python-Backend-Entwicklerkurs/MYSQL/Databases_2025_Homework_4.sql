
-- 1 Подключитесь к своей базе данных созданной на уроке
USE 210225_Borenko;
/*
2 Создайте таблицу, которая отражает погоду в 
Вашем городе за последние 5 дней и включает следующее столбцы
Id - первичный ключ, заполняется автоматически
Дата - не может быть пропуском
Дневная температура - целое число, принимает значения от -30 до 30
Ночная температура - целое число, принимает значения от -30 до 30
Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца
*/

CREATE TABLE Maycity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    HireDate DATE NOT NULL,
    Daytime_temperature INT CHECK (Daytime_temperature BETWEEN - 30 AND 30),
    Night_temperature INT CHECK (Night_temperature BETWEEN - 30 AND 30),
    Wind_speed DECIMAL(4 , 1 ) CHECK (Wind_speed >= 0)
);

select * from Maycity;

-- 3 Заполните таблицу 5 строками - за последние 5 дней 

INSERT INTO Maycity (HireDate, Daytime_temperature, Night_temperature, Wind_speed) 
VALUES
('2025-03-25', 5, -1, 15.5),
('2025-03-26', 7, 0, 2.8),
('2025-03-27', 4, -1, 20.1),
('2025-03-28', 6, 1, 1.3),
('2025-03-29', 8, 2, 10.5);

drop table Maycity;

-- 4 Увеличьте значения ночной температуры на градус если скорость ветра не превышала 3 м/с
UPDATE Maycity 
SET 
    Night_temperature = Night_temperature + 1
WHERE
    Wind_speed <= 3;


-- 5 На основе полученной таблицы создайте представление в своей базе данных - включите все строки Вашей таблицы и дополнительно рассчитанные столбцы

CREATE VIEW Weter_Maycity AS
    SELECT 
        *
    FROM
        Maycity;

-- Средняя суточная температура - среднее арифметическое между ночной и дневной температурами
-- Вычисляем среднюю суточную температуру без изменения таблицы
SELECT 
    HireDate,
    (Daytime_temperature + Night_temperature) / 2 AS Avg_Tem
FROM Maycity;

-- Столбец на основе скорости ветра - если скорость ветра не превышала 2 м/с то значение 
-- ‘штиль’, от 2 включительно до 5 - ‘умеренный ветер’, в остальных случаях - ‘сильный ветер’
select Wind_speed,  
	case 	
		when Wind_speed < 2 then  'штиль'
		when Wind_speed  BETWEEN 2 AND 5 then 'умеренный ветер'
		else 'сильный ветер'
 end
	as Wind from Maycity;	
