-- 1) Выбрать список сотрудников (Фамилия, Имя, Дата приема на работу и оклад). 
SELECT Lname, Fname, Date_Joined, Salary
FROM STAFF
-- 2) Выбрать список отделений и их номера телефонов.
SELECT DISTINCT Postcode, Btel_no
FROM BRANCH
--3) Выбрать список городов и улиц, где продаются объекты недвижимости, используя псевдоним.
SELECT  DISTINCT s.City, Street
FROM PROPERTY s;
--4) Выбрать все информацию о покупателях.
SELECT BUYER.*
FROM BUYER
--5) Просмотреть даты заключения договоров и стоимость услуг, используя псевдоним.
SELECT date.Date_Contract, Servise_cost
FROM CONTRACT date
--6) Вывести все объекты недвижимости для продажи в г. Витебске. 
SELECT   PROPERTY.*
FROM PROPERTY
WHERE City='Витебск';
--7) Вывести все объекты недвижимости для продажи, у которых название улицы заканчивается на -ая.
SELECT PROPERTY.*
FROM PROPERTY
WHERE Street LIKE '%ая';
--8) Выбрать перечень адресов трехкомнатных квартир, предлагаемых для продажи в Полоцке.
SELECT City, Street, House, Flat
FROM PROPERTY
WHERE City='Полоцк' AND Rooms = 3;
--9) Вывести дау приема на работу сотрудников отделения №8.
SELECT Lname, FName, Date_Joined
FROM STAFF
WHERE Branch_no=8;
--10) Выбрать перечень объектов собственности, принадлежащих каждому владельцу (указать Имя и Фамилию владельца).
SELECT OWNER.* 
FROM OWNER 
WHERE LName = 'Сергей'AND FName = 'Цалко'
--11) Показать список отделений компании, которые предлагают трехкомнатные квартиры c телефонами.
SELECT BRANCH.*
FROM BRANCH
WHERE Branch_no IN ( 
SELECT Branch_no
FROM PROPERTY
WHERE Rooms =2 AND Ptel != '-')
--12) Показать список владельцев квартир в г. Новополоцк, отсортировав в алфавитном порядке.
SELECT OWNER.*
FROM OWNER
WHERE City = 'Новополоцк'
ORDER BY FName, LName
--13) Выбрать объекты недвижимости, отсортировав по датам осмотра по убыванию.
SELECT *
FROM PROPERTY,VIEWING
WHERE (PROPERTY.Property_no = VIEWING.Property_no) 
ORDER BY Date_View DESC;
--14) Отобразить персонал компании, отсортировав по фамилии по возрастанию, и по имени по убыванию.
SELECT *
FROM STAFF
ORDER BY Lname, FName DESC
--15) Отобразить список договоров на покупку, 
--название нотариальной конторы и владельца квартиры (использовать псевдонимы). 
--Отсортировать по названию нотариальной конторы.
SELECT CONTR.Notary_Office, BUY.Lname, BUY.FName
FROM CONTRACT CONTR, BUYER BUY
WHERE (CONTR.Buyer_no = BUY.Buyer_no)
ORDER BY CONTR.Notary_Office
