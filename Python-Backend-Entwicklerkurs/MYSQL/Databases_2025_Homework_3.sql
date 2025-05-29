-- Работаем с таблицей purchase_order_details

select * from purchase_order_details;

-- 1 Посчитайте основные статистики - среднее, сумму, минимум, максимум столбца unit_cost.

SELECT 
    AVG(unit_cost) as u_AVG,
    MIN(unit_cost) as u_MIN,
    MAX(unit_cost) as u_MAX,
    Sum(unit_cost) as u_Sum
FROM
    purchase_order_details;

-- 2 Посчитайте количество уникальных заказов purchase_order_id

select count(distinct purchase_order_id) as c_purchase from purchase_order_details;


-- 3 Посчитайте количество продуктов product_id в каждом заказе purchase_order_id 
-- Отсортируйте полученные данные по убыванию количества

SELECT 
    COUNT(product_id) AS prod, purchase_order_id
FROM
    purchase_order_details
GROUP BY 2
ORDER BY 1 DESC
;


-- 4 Посчитайте заказы по дате доставки date_received Считаем только те продукты, количество quantity которых больше 30

SELECT 
    date_received, COUNT(*) AS order_colum
FROM
    purchase_order_details
WHERE
    quantity > 30
GROUP BY date_received;




-- 5 Посчитайте суммарную стоимость заказов в каждую из дат Стоимость заказа - произведение quantity на unit_cost


SELECT 
    SUM(quantity * unit_cost) AS suma_1, date_received
FROM
    purchase_order_details
GROUP BY 2;



-- 6 Сгруппируйте товары по unit_cost и вычислите среднее и максимальное значение quantity только для товаров где purchase_order_id не больше 100


SELECT 
    unit_cost, AVG(quantity) AS a_avg,
    MAX(quantity) AS a_max
FROM
    purchase_order_details
WHERE
    purchase_order_id < 100
GROUP BY unit_cost; 


-- 7 Выберите только строки где есть значения в столбце inventory_id Создайте столбец category
--  - если unit_cost > 20 то 'Expensive' в остальных случаях 'others' Посчитайте количество продуктов в каждой категории

SELECT 
    count(inventory_id),
    CASE
        WHEN unit_cost > 20 THEN 'Expensive'
        ELSE 'others'
    END AS categori

FROM
    purchase_order_details
WHERE
    inventory_id IS NOT NULL
    group by categori;


