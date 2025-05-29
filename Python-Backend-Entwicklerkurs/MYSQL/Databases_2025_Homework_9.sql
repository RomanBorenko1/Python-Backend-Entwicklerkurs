-- 1 Для каждого заказа order_id выведите минимальный, максмальный и средний unit_cost

select
	purchase_order_id, 
	MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
	max(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
	avg(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM 
	purchase_order_details;
        
    
-- 2  Оставьте только уникальные строки из предыдущего запроса

select
	DISTINCT
    purchase_order_id,
	MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
	max(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
	avg(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM 
	purchase_order_details;
    

-- 3 Посчитайте стоимость продукта в заказе как quantity*unit_cost 
-- Выведите суммарную стоимость продуктов с помощью оконной функции Сделайте то же самое с помощью GROUP BY

-- ВАРИАНТ 1
SELECT 
    product_id, 
    quantity * unit_cost AS p_price, 
    SUM(quantity * unit_cost) OVER (PARTITION BY product_id) AS oll_price
FROM 
    purchase_order_details;
    
    
-- ВАРИАНТ 2

SELECT 
    product_id, SUM(quantity * unit_cost) AS price
FROM
    purchase_order_details
GROUP BY product_id;


-- 4 Посчитайте количество заказов по дате получения и 
-- posted_to_inventory Если оно превышает 1 то выведите '>1' в противном случае '=1'

SELECT
    date_received,
    posted_to_inventory,
    COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) AS count_,
CASE
	WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
	ELSE '=1'
END AS antwort
FROM
    purchase_order_details
    where date_received IS NOT NULL;



-- Выведите purchase_order_id, date_received и вычисленный столбец

SELECT
    purchase_order_id,
    date_received,
CASE
	WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
	ELSE '=1'
END AS antwort
FROM
    purchase_order_details
    where date_received IS NOT NULL;
