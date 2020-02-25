--1) Показать список имеющихся владельцев квартир и их объекты
--недвижимости для продажи.
SELECT OWNER.FName, OWNER.LName, PROPERTY.City, PROPERTY.Street, PROPERTY.House, PROPERTY.Flat, PROPERTY.Rooms
FROM OWNER 
LEFT JOIN PROPERTY 
ON OWNER.Owner_no = PROPERTY.Owner_no
WHERE PROPERTY.City is NOT NULL
--2) Вывести список объектов недвижимости, по которым заключены
--контракты.
SELECT PROPERTY.City, PROPERTY.Street, PROPERTY.House, PROPERTY.Flat, PROPERTY.Rooms
FROM CONTRACT
RIGHT JOIN PROPERTY
ON CONTRACT.Property_no = PROPERTY.Property_no
--3) Показать список просмотров квартир и их потенциальных
--покупателей.
SELECT BUYER.Lname, BUYER.FName, BUYER.City, BUYER.Street, BUYER.House, BUYER.Flat, VIEWING.Comments 
FROM VIEWING
LEFT JOIN BUYER
ON VIEWING.Buyer_no = BUYER.Buyer_no
--4) Вывести список покупателей и отделения, в которые они
--обращались.
SELECT BUYER.Lname, BUYER.FName, BRANCH.Postcode, BRANCH.City, BRANCH.Street, BRANCH.House
FROM BUYER
LEFT JOIN BRANCH
ON BUYER.Branch_no = BRANCH.Branch_no
--5) Показать список отделений и список персонала.
SELECT STAFF.Lname, STAFF.FName, BRANCH.Postcode, BRANCH.City, BRANCH.Street, BRANCH.House
FROM STAFF
LEFT JOIN BRANCH
ON STAFF.Branch_no = BRANCH.Branch_no
--6) Вывести данные о покупателях, и отделениях, в которые они
--обратились. Использовать соединение во фразе Where.
SELECT BUYER.Lname, BUYER.FName, BRANCH.Postcode, BRANCH.City, BRANCH.Street, BRANCH.House
FROM BUYER, BRANCH
WHERE BUYER.Branch_no = BRANCH.Branch_no
