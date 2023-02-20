
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
 --Выбор Возраст=17 и Возраст=18 лет таблице Students
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


-- Вывод таблиц Students и Groups, Многотабличный запрос
SELECT name, surname, Gruppa_name
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id

--- Урок 5 ---
-- Вывод таблиц Students и Groups, Использование псевдонимов
SELECT	Students.id as 'Students_id', 
		Students.name, 
		Students.surname, 
		Groups.Gruppa_name,
		Groups.id as 'Groups_id'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id



-- 1. Вывести таблицу кафедр, но расположить ее поля в об-
-- ратном порядке.

SELECT * 
FROM Faculties
ORDER BY id DESC;

-- 2. Вывести названия групп и их рейтинги, используя в каче-
-- стве названий выводимых полей “Group Name” и “Group Rating” 
-- соответственно. 

SELECT 
	Name as 'Group Name',
	Rating as 'Group Rating'
FROM Groups


-- Функция COUNT
SELECT COUNT(id) 
FROM Students

-- Функция AVG
SELECT AVG(age) as 'Average_age'
FROM Students


-- Функция SUM
SELECT SUM(age) as 'Sum of ages'
FROM Students


-- Функция MIN , MAX
SELECT MIN(age) as 'Min age', 
	   MAX(age) as 'Max age'
FROM Students

--необходимо узнать количество студентов, 
-- которые учатся в группе "С+":
SELECT COUNT(*) as 'Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
	  AND
	  Groups.Gruppa_Name LIKE '%C++%';


--необходимо узнать количество студентов, 
-- в каждой группе:
SELECT Groups.Gruppa_Name, 
	   COUNT(*) as 'Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
Group BY Groups.Gruppa_Name


SELECT MAX(Groups.Gruppa_Name), 
	   COUNT(*) as 'Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
Group BY Groups.id


SELECT Groups.Gruppa_Name, 
	   COUNT(*) as 'Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
Group BY Groups.Gruppa_Name
HAVING COUNT(*)<4 


-- Вывод таблиц Students и Groups, Многотабличный запрос -- миксимальный возраст
SELECT name, surname, Gruppa_name, age
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
	  AND age = (SELECT MAX(age) FROM Students) -- миксимальный возраст




--- Урок 7 ---

-- Пример UNION
SELECT name, surname, age from Students
UNION
SELECT name, surname, age from Students_new;


-- Пример UNION ALL
SELECT name, surname, age from Students
UNION ALL
SELECT name, surname, age from Students;



-- Пример Обединения INER JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
INNER JOIN Groups as G on S.gruppa_id = G.id


-- Пример Обединения LEFT JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
LEFT JOIN Groups as G on S.gruppa_id = G.id

-- Пример Обединения RIGHT JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
RIGHT JOIN Groups as G on S.gruppa_id = G.id


-- Пример Обединения FULL (OUTER) JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
FULL JOIN Groups as G on S.gruppa_id = G.id


-- Academy_Homwork_7

--1. Вывести названия аудиторий (LectureRooms)), в которых читает лекции
--преподаватель “Edward Hopper”.

SELECT LectureRooms.Name
FROM LectureRooms
	INNER JOIN Schedules on Schedules.LectureRoomId = LectureRooms.Id
	INNER JOIN Lectures on Schedules.LectureId = Lectures.Id
	INNER JOIN Teachers on Lectures.TeacherId = Teachers.Id
--WHERE Teachers.Name+' '+Teachers.Surname = 'Edward Hopper'
WHERE Teachers.Name='Edward' AND Teachers.Surname = 'Hopper'






--- Урок 8 ---

-- Пример Обединения INER JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
INNER JOIN Groups as G on S.gruppa_id = G.id

-- Cоздании представлений  Students_View
CREATE VIEW Students_View
AS
SELECT        Students.name AS Student_Name, Students.surname AS Student_Surname, Groups.Gruppa_Name AS Gruppa_name
FROM          Groups 
INNER JOIN Students ON dbo.Groups.id = dbo.Students.gruppa_id;


-- Чтения представлений  Students_View
SELECT * FROM Students_View;


-- Изменениия представлений  Students_View
ALTER VIEW Students_View
AS
SELECT Students.name AS Student_Name, 
	   Students.surname AS Student_Surname, 
	   Groups.Gruppa_Name AS Gruppa_name,
	   Students.name+''+Students.surname AS Student_FULL_Name

FROM  Groups 
INNER JOIN Students ON dbo.Groups.id = dbo.Students.gruppa_id;

-- Удаления представлений  Students_View
DROP VIEW Students_View;


-- Cоздании представлений  Students_View

--необходимо узнать количество студентов, в каждой группе:

-- Cоздании представлений  Students_Count_In_Groups
CREATE VIEW Students_Count_In_Groups
AS
SELECT Groups.Gruppa_Name, 
	   COUNT(*) as 'Students_Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
Group BY Groups.Gruppa_Name

-- Чтения представлений  Students_Count_In_Groups
SELECT * FROM Students_Count_In_Groups;


-- Задание 1. Создайте базу данных «Телефонный справочник»
CREATE DATABASE PHONE_BOOK;


CREATE TABLE [dbo].[Peoples_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Birth_date] [date] NULL,
	[Male_Female] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
 CONSTRAINT [PK_Peoples_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--- Задание 2. Создайте базу данных «Продажи».

CREATE DATABASE APPLE_SALES_DATABASE;

--- Созадния таблицы Salers_table - О продавцах
CREATE TABLE [dbo].[Salers_table](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Full_name] [nvarchar](100) NULL,
    [Email] [nvarchar](100) NULL,
    [Phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_Salers_table] PRIMARY KEY CLUSTERED 
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 

--- Созадния таблицы Customers_table - О покупателях
CREATE TABLE [dbo].[Customers_table](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [Full_name] [nvarchar](100) NULL,
    [Email] [nvarchar](100) NULL,
    [Phone] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customers_table] PRIMARY KEY CLUSTERED 
(
    [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--- Созадния таблицы Sales_table - О продажах 
CREATE TABLE [dbo].[Sales_table](
	[id] [int] NOT NULL,
	[Customer_id] [int] NULL,
	[Saler_id] [int] NULL,
	[Product_name] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Sales_date] [date] NULL,
 CONSTRAINT [PK_Sales_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




--- Урок 9 ---
-- Таблица истории студентов
CREATE TABLE Students_History 
(
    Id INT IDENTITY PRIMARY KEY,
    Student_id INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);

-- При добавлении данных (при выполнении команды INSERT) 
CREATE TRIGGER Students_On_Insert
   ON  Students
   AFTER INSERT
AS 
BEGIN
	
	INSERT INTO Students_History (Student_id, Operation)
	SELECT Id, 'Добавлен Студент: '+INSERTED.name+' '+INSERTED.surname
			+', Группа:' + CAST(INSERTED.gruppa_id AS nvarchar)
	FROM INSERTED;

END

-- При Удалении данных (при выполнении команды DELETE) 
ALTER TRIGGER Students_On_Delete
   ON  Students
   AFTER DELETE
AS 
BEGIN
	
	--return;
	INSERT INTO Students_History (Student_id, Operation)
	SELECT Id, 'Удален Студент: '+name+' '+surname+', Группа:' + CAST(gruppa_id AS nvarchar)
	FROM DELETED;

END


DELETE FROM Students
WHERE Id=1011
 
SELECT * FROM Students_History


-- Оператор PRINT позволяет вывести строку
PRINT 'Hello World'

-- Условный оператор if.else,
IF (datename(dw, GetDate())) = 'Monday'
begin
	PRINT 'Сегодня понедельник'
end
else
	PRINT 'Сегодня не понедельник'


------------------



--- Урок 10 ---


-- Циклы  while

declare @i int
set @i = 1
-- запускаем цикл

while @i<10
begin
	print @i
	set @i = @i + 1
	if @i > 5
	break
end


-- Циклы  while Добавить 10 студентов 

declare @i int
set @i = 1
-- запускаем цикл
while @i<10
begin
	print @i
	
	-- Вставка данных в таблицу Students
	INSERT INTO Students(name, surname, age, gruppa_id)
	VALUES ('Name_' + CAST(@i AS nvarchar), 'Surname_' + CAST(@i AS nvarchar), 17, 13);

	set @i = @i + 1
end

-- Процедура Количество студентов в группах 

CREATE PROCEDURE Proc_Students_Count_in_Groups
AS 
BEGIN

	SELECT Groups.Gruppa_Name, COUNT(*) as 'Students_Count'
	FROM Students, Groups
	WHERE Students.gruppa_id = Groups.id
	Group BY Groups.Gruppa_Name

END

-- Зупуск процедуры 
EXEC Proc_Students_Count_in_Groups;

-- Процедура список студентов в группах пример 'CASE'
CREATE PROCEDURE Proc_Students_Count_in_Groups2
AS 
BEGIN

	SELECT Students.name + ' ' +Students.surname,  
		   Gruppa_Name, 
		  case 
		  when Groups.Gruppa_Name IS NOT NULL then '-- Есть группы --'
		  when Groups.Gruppa_Name IS NULL then '-- Без группы --'
		  end as Gruppa_info
		  
	FROM   Students
	LEFT JOIN Groups on Students.gruppa_id = Groups.id
	-- Group BY Groups.Gruppa_Name

END

GO

-- Зупуск процедуры 
EXEC Proc_Students_Count_in_Groups2;



-- Процедура список студентов в группах по названию группы 
CREATE PROCEDURE Proc_Students_list_by_Groups_name
	@Gruppa_name_input nvarchar(100) -- Входной параметр название группы 
AS 
BEGIN
	SELECT Students.name + ' ' +Students.surname,  
		   Gruppa_Name
	FROM   Students
	LEFT JOIN Groups on Students.gruppa_id = Groups.id
	WHERE Groups.Gruppa_Name LIKE '%'+@Gruppa_name_input+'%'
END

GO

-- Зупуск процедуры 
EXEC Proc_Students_list_by_Groups_name 'HTML';
-- Зупуск процедуры 
EXEC Proc_Students_list_by_Groups_name 'PHP';
-- Зупуск процедуры 
EXEC Proc_Students_list_by_Groups_name 'C+';


--- Урок 11 ---
SELECT * from sys.all_objects
where sys.all_objects.type = 'U'

SELECT * from sys.tables

SELECT * from sys.columns

SELECT * from sys.foreign_keys



CREATE login [admin]
with password='admin'

CREATE login [user]
with password='user'



USE [master]
GO
ALTER LOGIN [admin] WITH PASSWORD='1111'
GO



ALTER SERVER ROLE [sysadmin] ADD MEMBER [admin]
GO
USE [APPLE_SALES_DATABASE]
GO
CREATE USER [admin] FOR LOGIN [admin]
GO
