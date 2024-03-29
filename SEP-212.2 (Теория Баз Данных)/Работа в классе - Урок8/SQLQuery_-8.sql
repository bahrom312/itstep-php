
--- ���� 3 ---

--����� ���� ����� � ����� � ������� Students
SELECT * FROM Students

--����� ���� Nam� ������� Students
SELECT Students.name FROM Students

--����� ���� Nam�, surname ������� Students
SELECT 
	surname, 
	name  
FROM Students

--����� ���� Nam�, surname ������� Students
SELECT name+' '+surname AS FullName FROM Students

--����� ���� nam�+surname+age ������� Students
SELECT 
	name+' '+surname+', �������:'+CAST(age AS nvarchar) AS FullNameAge 
FROM Students

--����� top 10 ������� Students
SELECT top 2
	surname, name  
FROM Students


--����� ��� �������� ������� Students
SELECT DISTINCT age
FROM Students


 --����� ������� ������ 17 ��� ������� Students
SELECT * 
FROM Students
WHERE age>17 


 --����� �������=17 � Name ������� "Nikita%" ��� ������� Students
SELECT * 
FROM Students
WHERE age=17 AND name like 'Nikit%'

 --����� ���������� Name ������� Students
SELECT * 
FROM Students
ORDER BY name ASC


--- ���� 4 ---
 --����� �������=17 � �������=18 ��� ������� Students
SELECT * 
FROM Students
--WHERE age=17 OR age=18 OR age=19
WHERE age IN (17, 18, 19)

 --����� ������� 15 ����� 19 ��� ������� Students
SELECT * 
FROM Students
--WHERE age>=15 AND age<=19
WHERE age BETWEEN 15 AND 19

 --����� Name ������� "Niki%" ��� ������� Students
SELECT * 
FROM Students
WHERE name like 'Niki%';

-- ������� ������ � ������� Students
INSERT INTO Students(name, surname, age)
VALUES ('Tsoy', 'Nikita2', 17);


-- ������� ������ �� ������� Students � ������� Students2
INSERT INTO Students2(name, surname, age)
SELECT DISTINCT name, surname, age FROM Students;

-- �������� ������� Students_new �� ������� Students
SELECT DISTINCT name, surname, age 
INTO Students_new
FROM Students;


-- ��������� ���� "Nikita2" �� "Nikita" 
UPDATE Students
SET name = 'Nikita'
WHERE name = 'Nikita2';


-- ��������� ���� age + 1 
UPDATE Students
SET age = age - 1;
--WHERE name = 'Nikita2';

-- �������� �� ������� �� ������� Students
DELETE FROM Students
WHERE id>3;

DELETE FROM Students_new;


-- ����� ������ Students � Groups, �������������� ������
SELECT name, surname, Gruppa_name
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id

--- ���� 5 ---
-- ����� ������ Students � Groups, ������������� �����������
SELECT	Students.id as 'Students_id', 
		Students.name, 
		Students.surname, 
		Groups.Gruppa_name,
		Groups.id as 'Groups_id'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id



-- 1. ������� ������� ������, �� ����������� �� ���� � ��-
-- ������ �������.

SELECT * 
FROM Faculties
ORDER BY id DESC;

-- 2. ������� �������� ����� � �� ��������, ��������� � ����-
-- ���� �������� ��������� ����� �Group Name� � �Group Rating� 
-- ��������������. 

SELECT 
	Name as 'Group Name',
	Rating as 'Group Rating'
FROM Groups


-- ������� COUNT
SELECT COUNT(id) 
FROM Students

-- ������� AVG
SELECT AVG(age) as 'Average_age'
FROM Students


-- ������� SUM
SELECT SUM(age) as 'Sum of ages'
FROM Students


-- ������� MIN , MAX
SELECT MIN(age) as 'Min age', 
	   MAX(age) as 'Max age'
FROM Students

--���������� ������ ���������� ���������, 
-- ������� ������ � ������ "�+":
SELECT COUNT(*) as 'Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
	  AND
	  Groups.Gruppa_Name LIKE '%C++%';


--���������� ������ ���������� ���������, 
-- � ������ ������:
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


-- ����� ������ Students � Groups, �������������� ������ -- ������������ �������
SELECT name, surname, Gruppa_name, age
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
	  AND age = (SELECT MAX(age) FROM Students) -- ������������ �������




--- ���� 7 ---

-- ������ UNION
SELECT name, surname, age from Students
UNION
SELECT name, surname, age from Students_new;


-- ������ UNION ALL
SELECT name, surname, age from Students
UNION ALL
SELECT name, surname, age from Students;



-- ������ ���������� INER JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
INNER JOIN Groups as G on S.gruppa_id = G.id


-- ������ ���������� LEFT JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
LEFT JOIN Groups as G on S.gruppa_id = G.id

-- ������ ���������� RIGHT JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
RIGHT JOIN Groups as G on S.gruppa_id = G.id


-- ������ ���������� FULL (OUTER) JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
FULL JOIN Groups as G on S.gruppa_id = G.id


-- Academy_Homwork_7

--1. ������� �������� ��������� (LectureRooms)), � ������� ������ ������
--������������� �Edward Hopper�.

SELECT LectureRooms.Name
FROM LectureRooms
	INNER JOIN Schedules on Schedules.LectureRoomId = LectureRooms.Id
	INNER JOIN Lectures on Schedules.LectureId = Lectures.Id
	INNER JOIN Teachers on Lectures.TeacherId = Teachers.Id
--WHERE Teachers.Name+' '+Teachers.Surname = 'Edward Hopper'
WHERE Teachers.Name='Edward' AND Teachers.Surname = 'Hopper'






--- ���� 8 ---

-- ������ ���������� INER JOIN
SELECT S.name, 
	   S.surname, 
	   G.Gruppa_Name,
	   G.id
FROM Students as S
INNER JOIN Groups as G on S.gruppa_id = G.id

-- C������� �������������  Students_View
CREATE VIEW Students_View
AS
SELECT        Students.name AS Student_Name, Students.surname AS Student_Surname, Groups.Gruppa_Name AS Gruppa_name
FROM          Groups 
INNER JOIN Students ON dbo.Groups.id = dbo.Students.gruppa_id;


-- ������ �������������  Students_View
SELECT * FROM Students_View;


-- ���������� �������������  Students_View
ALTER VIEW Students_View
AS
SELECT Students.name AS Student_Name, 
	   Students.surname AS Student_Surname, 
	   Groups.Gruppa_Name AS Gruppa_name,
	   Students.name+''+Students.surname AS Student_FULL_Name

FROM  Groups 
INNER JOIN Students ON dbo.Groups.id = dbo.Students.gruppa_id;

-- �������� �������������  Students_View
DROP VIEW Students_View;


-- C������� �������������  Students_View

--���������� ������ ���������� ���������, � ������ ������:

-- C������� �������������  Students_Count_In_Groups
CREATE VIEW Students_Count_In_Groups
AS
SELECT Groups.Gruppa_Name, 
	   COUNT(*) as 'Students_Count'
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id
Group BY Groups.Gruppa_Name

-- ������ �������������  Students_Count_In_Groups
SELECT * FROM Students_Count_In_Groups;


-- ������� 1. �������� ���� ������ ����������� ����������
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


--- ������� 2. �������� ���� ������ ��������.

CREATE DATABASE APPLE_SALES_DATABASE;

--- �������� ������� Salers_table - � ���������
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

--- �������� ������� Customers_table - � �����������
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


--- �������� ������� Sales_table - � �������� 
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


