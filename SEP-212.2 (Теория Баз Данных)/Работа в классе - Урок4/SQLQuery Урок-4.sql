
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

-- ����� �������=17 � �������=18 ��� ������� Students
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


--- ���� �4 - �������������� ���� ������ --- 

SELECT name, surname, Gruppa_name
FROM Students, Groups
WHERE Students.gruppa_id = Groups.id

