-- 1   Вывести названия продуктов таблица products, 
-- включая количество заказанных единиц quantity для каждого продукта таблица order_details.
WITH cte AS (
    SELECT 
        product_id,
        quantity
    FROM 
        order_details
)
SELECT 
    p.product_name,
    c.quantity
FROM 
    products as p
left join
	cte as c
    on p.id = c.product_id;
SELECT 
        product_id,
        quantity
    FROM 
        order_details;
-- Решить задачу с помощью cte и подзапроса
SELECT 
    p.product_name,
    (SELECT od.quantity FROM order_details as od
        WHERE od.product_id = p.id
        LIMIT 1
    ) AS q
FROM 
    products  as p;


-- 2  Найти все заказы таблица orders, сделанные после даты
-- самого первого заказа клиента Lee таблица customers.
select * from orders as o
left join 
	customers as c
on o.customer_id = c.id
	where o.order_date > (
select min(order_date) from orders as o2
	left join 
customers as c2
	on o2.customer_id = c2.id
where last_name = 'Lee'
);


-- 3 Найти все продукты таблицы  products c максимальным target_level
SELECT 
    product_name, target_level
FROM
    products
WHERE
    target_level = (SELECT 
            MAX(target_level)
        FROM
            products)
; 







