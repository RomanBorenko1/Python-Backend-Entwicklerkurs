-- 1. Выберите все строки из таблицы suppliers. Предварительно подключитесь к базе данных northwind
SELECT 
    *
FROM
    suppliers;


-- 2. Выберите только те строки из таблицы suppliers где company имеет значение Supplier A
SELECT 
    *
FROM
    suppliers
WHERE
    company = 'Supplier A';

-- 3. Выберите все строки из таблицы purchase_orders
SELECT 
    *
FROM
    purchase_orders;
    
    
    
-- -- 4. Выберите только те строки из таблицы purchase_orders  где supplier_id = 2
SELECT 
    *
FROM
    purchase_orders
WHERE
    supplier_id = 2;
    
    
    
-- -- 5. Выберите supplier_id и shipping_fee из purchase_orders там где created_by равно 1 и supplier_id равен 5 Объясните полученный результат
SELECT 
    supplier_id, shipping_fee
FROM
     purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;
/*С начала я выбираю два конкретных поля из таблицы: supplier_id  и shipping_fee,
так как это указанно в задании.
теперь я указываю что данные я беру из таблицы purchase_orders.
дальше я нахожу с помощью команды WHERE - где created_by = 1 и supplier_id = 5.
В результате я неполучил не каких данных. Потому что в поле  created_by
у нас есть только 3 записи которые равны 1 и они не соответствуют записям в поле supplier_id которые равны 5.
Тоесть условие AND которое подрозумевает только True если оба условия совпадают неработает. Но в нашем случае.
мы можем получить данные только в том случае если поменяем условие на OR.
В общем отсутствие данных в выводе связано с тем, что в таблице purchase_orders нет строк, 
где одновременно created_by = 1 и supplier_id = 5 */   


    

-- 6. Выберите last_name и first_name из таблицы employees
-- там где адрес address имеет значение 123 2nd Avenue или 123 8th Avenue
-- Напишите запрос двумя способами - с применением оператора OR и оператора IN
SELECT 
    last_name, first_name
FROM
    employees
    WHERE address = '123 2nd Avenue' OR address = '123 8th Avenue';
    
/*Я вывел два поля last_name, first_name в таблице employees.
и данныые соответствующие
условию в котором address должен соответствовать значение 123 2nd Avenue
или 123 8th Avenue.*/   

SELECT 
    last_name, first_name
FROM
    employees
    where address in ('123 2nd Avenue', '123 8th Avenue');



-- 7. Выведите все имена сотрудников, которые содержат английскую букву p в середине фамилии
SELECT 
    first_name
FROM
    employees
WHERE
    last_name LIKE '%p%';
-- Находим в поле first_name где запись last_name содержит в середине английскую букву p 



-- 8. Выберите все строки из таблицы orders там где нет информации о  shipper_id
SELECT 
    *
FROM
    orders
WHERE
    shipper_id IS NULL;
-- Я выбрал все записи из таблицы orders где shipper_id не содержит информацию   


-- 9. Отформатируйте стиль написания запросов


-- 10. Сохраните запросы в виде файла с расширением .sql и загрузите на платформу