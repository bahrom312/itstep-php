
--- Урок 3 ---

--Выбор всех строк и полей в таблице Students
SELECT * FROM Students

--Выбор Поля Namе таблице Students
SELECT Students.name FROM Students

--Выбор Поля Namе, surname таблице Students
SELECT 
	surname, 
	name  
FROM Students

--Выбор Поля Namе, surname таблице Students
SELECT name+' '+surname AS FullName FROM Students

--Выбор Поля namе+surname+age таблице Students
SELECT 
	name+' '+surname+', Возраст:'+CAST(age AS nvarchar) AS FullNameAge 
FROM Students

--Выбор top 10 таблице Students
SELECT top 2
	surname, name  
FROM Students


--Выбор Без повторов таблице Students
SELECT DISTINCT age
FROM Students


 --Выбор Возраст больще 17 лет таблице Students
SELECT * 
FROM Students
WHERE age>17 


 --Выбор Возраст=17 и Name похожий "Nikita%" лет таблице Students
SELECT * 
FROM Students
WHERE age=17 AND name like 'Nikit%'

 --Выбор сортировка Name таблице Students
SELECT * 
FROM Students
ORDER BY name ASC


--- Урок 4 ---

-- Выбор Возраст=17 и Возраст=18 лет таблице Students
SELECT * 
FROM Students
--WHERE age=17 OR age=18 OR age=19
WHERE age IN (17, 18, 19)

 --Выбор Возраст 15 между 19 лет таблице Students
SELECT * 
FROM Students
--WHERE age>=15 AND age<=19
WHERE age BETWEEN 15 AND 19

 --Выбор Name похожий "Niki%" лет таблице Students
SELECT * 
FROM Students
WHERE name like 'Niki%';

-- Вставка данных в таблицу Students
INSERT INTO Students(name, surname, age)
VALUES ('Tsoy', 'Nikita2', 17);


-- Вставка данных из таблицу Students в таблицу Students2
INSERT INTO Students2(name, surname, age)
SELECT DISTINCT name, surname, age FROM Students;

-- Создания таблицы Students_new из таблицы Students
SELECT DISTINCT name, surname, age 
INTO Students_new
FROM Students;


-- Изменения поле "Nikita2" на "Nikita" 
UPDATE Students
SET name = 'Nikita'
WHERE name = 'Nikita2';


-- Изменения поле age + 1 
UPDATE Students
SET age = age - 1;
--WHERE name = 'Nikita2';

-- Удаления из таблицы из таблицы Students
DELETE FROM Students
WHERE id>3;

DELETE FROM Students_new;


--- Урок №4 - Многотабличные базы данных --- 

SELECT name, surname, Gruppa_name
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id

