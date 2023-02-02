
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


 --Выбор Возраст=17 и Name похожий "Nikita%"  таблице Students
SELECT * 
FROM Students
WHERE age=17 AND name like 'Nikit%'

 --Выбор сортировка по Name таблице Students
SELECT * 
FROM Students
ORDER BY name ASC



