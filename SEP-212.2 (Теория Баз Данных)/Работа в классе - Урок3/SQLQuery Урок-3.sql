
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


 --����� �������=17 � Name ������� "Nikita%"  ������� Students
SELECT * 
FROM Students
WHERE age=17 AND name like 'Nikit%'

 --����� ���������� �� Name ������� Students
SELECT * 
FROM Students
ORDER BY name ASC



