-- 1) ������� ������ ����������� (�������, ���, ���� ������ �� ������ � �����). 
SELECT Lname, Fname, Date_Joined, Salary
FROM STAFF
-- 2) ������� ������ ��������� � �� ������ ���������.
SELECT DISTINCT Postcode, Btel_no
FROM BRANCH
--3) ������� ������ ������� � ����, ��� ��������� ������� ������������, ��������� ���������.
SELECT  DISTINCT s.City, Street
FROM PROPERTY s;
--4) ������� ��� ���������� � �����������.
SELECT BUYER.*
FROM BUYER
--5) ����������� ���� ���������� ��������� � ��������� �����, ��������� ���������.
SELECT date.Date_Contract, Servise_cost
FROM CONTRACT date
--6) ������� ��� ������� ������������ ��� ������� � �. ��������. 
SELECT   PROPERTY.*
FROM PROPERTY
WHERE City='�������';
--7) ������� ��� ������� ������������ ��� �������, � ������� �������� ����� ������������� �� -��.
SELECT PROPERTY.*
FROM PROPERTY
WHERE Street LIKE '%��';
--8) ������� �������� ������� ������������� �������, ������������ ��� ������� � �������.
SELECT City, Street, House, Flat
FROM PROPERTY
WHERE City='������' AND Rooms = 3;
--9) ������� ��� ������ �� ������ ����������� ��������� �8.
SELECT Lname, FName, Date_Joined
FROM STAFF
WHERE Branch_no=8;
--10) ������� �������� �������� �������������, ������������� ������� ��������� (������� ��� � ������� ���������).
SELECT OWNER.* 
FROM OWNER 
WHERE LName = '������'AND FName = '�����'
--11) �������� ������ ��������� ��������, ������� ���������� ������������� �������� c ����������.
SELECT BRANCH.*
FROM BRANCH
WHERE Branch_no IN ( 
SELECT Branch_no
FROM PROPERTY
WHERE Rooms =2 AND Ptel != '-')
--12) �������� ������ ���������� ������� � �. ����������, ������������ � ���������� �������.
SELECT OWNER.*
FROM OWNER
WHERE City = '����������'
ORDER BY FName, LName
--13) ������� ������� ������������, ������������ �� ����� ������� �� ��������.
SELECT *
FROM PROPERTY,VIEWING
WHERE (PROPERTY.Property_no = VIEWING.Property_no) 
ORDER BY Date_View DESC;
--14) ���������� �������� ��������, ������������ �� ������� �� �����������, � �� ����� �� ��������.
SELECT *
FROM STAFF
ORDER BY Lname, FName DESC
--15) ���������� ������ ��������� �� �������, 
--�������� ������������ ������� � ��������� �������� (������������ ����������). 
--������������� �� �������� ������������ �������.
SELECT CONTR.Notary_Office, BUY.Lname, BUY.FName
FROM CONTRACT CONTR, BUYER BUY
WHERE (CONTR.Buyer_no = BUY.Buyer_no)
ORDER BY CONTR.Notary_Office
