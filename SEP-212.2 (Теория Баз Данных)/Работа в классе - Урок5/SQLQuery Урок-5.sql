
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
-- ������ �������. (��)

SELECT * 
FROM Faculties
ORDER BY id DESC;


-- 2. ������� �������� ����� � �� ��������, ��������� � ����-
-- ���� �������� ��������� ����� �Group Name� � �Group Rating� 
-- ��������������. (��)

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