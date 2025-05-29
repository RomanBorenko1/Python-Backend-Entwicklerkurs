-- 1 Для каждого product_id выведите inventory_id а также предыдущий и последующей inventory_id по убыванию quantity
select product_id,
		inventory_id, 
    Lag(inventory_id) OVER(partition by product_id order by quantity desc) as ferst_v,
    Lead(inventory_id) OVER(partition by product_id order by quantity desc) as last_v 
from order_details;

-- 2 Выведите максимальный и минимальный unit_price для каждого order_id
-- с помощью функции FIRST VALUE  Вывести order_id и полученные значения

SELECT 
	DISTINCT
	order_id,
FIRST_VALUE(unit_price) 
	OVER(PARTITION BY order_id ORDER BY unit_price  DESC) AS teibel_1,
FIRST_VALUE(unit_price) 
	OVER(PARTITION BY order_id ORDER BY unit_price) AS teibel_2  
	FROM 
		order_details;


-- 3 Выведите order_id и столбец с разнице между  unit_price для каждой заказа и минимальным unit_price
--  в рамках одного заказа Задачу решить двумя способами - с помощью First VAlue и MIN

-- Первый вариант 
SELECT 
    order_id,
    unit_price,
    unit_price - FIRST_VALUE(unit_price) 
		OVER (PARTITION BY order_id ORDER BY unit_price) AS preis
FROM 
    order_details;
    
-- Второй вариант     
    
SELECT 
    order_id,
    unit_price,
    unit_price - MIN(unit_price) 
		OVER (PARTITION BY order_id) AS preis
FROM 
    order_details;

	
-- 4 Присвойте ранг каждой строке используя RANK по убыванию quantity
select * from order_details;
SELECT 
    order_id,
    unit_price,
   quantity,
    unit_price - MIN(unit_price)
		OVER (PARTITION BY order_id) AS preis,
        RANK() OVER (PARTITION BY order_id Order BY quantity desc) AS Quantity_RANK
FROM 
    order_details;

-- 5  Из предыдущего запроса выберите только строки с рангом до 10 включительно

    
with cte as (    
    SELECT 
    order_id,
    unit_price,
    quantity,
    unit_price - MIN(unit_price) OVER (PARTITION BY order_id) AS preis,
    RANK() OVER (PARTITION BY order_id ORDER BY quantity DESC) AS Quantity_RANK
FROM 
    order_details)
    
SELECT *
	FROM cte
	WHERE
		Quantity_RANK <= 10; 
    

