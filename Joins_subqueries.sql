--1. To list all customers who live in Texas, you can use the following SQL query with an INNER JOIN:
SELECT Customers.CustomerName 
FROM Customers 
INNER JOIN Addresses ON Customers.CustomerID = Addresses.CustomerID 
INNER JOIN Cities ON Addresses.CityID = Cities.CityID 
INNER JOIN Countries ON Cities.CountryID = Countries.CountryID 
WHERE Countries.Country = 'USA' AND Cities.City = 'Texas';

--2.To get all payments above $6.99 with the customer's full name, you can use the following SQL query with an INNER JOIN:
SELECT Customers.CustomerName, Payments.PaymentAmount 
FROM Customers 
INNER JOIN Payments ON Customers.CustomerID = Payments.CustomerID 
WHERE Payments.PaymentAmount > 6.99;

--3. To show all customers' names who have made payments over $175, you can use the following SQL query with a subquery:
SELECT CustomerName 
FROM Customers 
WHERE CustomerID IN (
	SELECT CustomerID 
	FROM Payments 
	WHERE PaymentAmount > 175
);

--4. To list all customers that live in Nepal, you can use the following SQL query with an INNER JOIN:
SELECT Customers.CustomerName 
FROM Customers 
INNER JOIN Addresses ON Customers.CustomerID = Addresses.CustomerID 
INNER JOIN Cities ON Addresses.CityID = Cities.CityID 
INNER JOIN Countries ON Cities.CountryID = Countries.CountryID 
WHERE Countries.Country = 'Nepal';

--5. To find the staff member who had the most transactions, you can use the following SQL query with a subquery:
SELECT StaffName 
FROM Staff 
WHERE StaffID = (
	SELECT StaffID 
	FROM Transactions 
	GROUP BY StaffID 
	ORDER BY COUNT(*) DESC 
	LIMIT 1
);

--6. To show how many movies of each rating are there, you can use the following SQL query with a GROUP BY clause:
SELECT Rating, COUNT(*) 
FROM Movies 
GROUP BY Rating;

--7. To show all customers who have made a single payment above $6.99, you can use the following SQL query with a subquery:
SELECT CustomerName 
FROM Customers 
WHERE CustomerID IN (
	SELECT CustomerID 
	FROM Payments 
	GROUP BY CustomerID 
	HAVING SUM(PaymentAmount) > 6.99 AND COUNT(*) = 1
);

--8. To find how many free rentals our stores gave, you can use the following SQL query with a subquery:
SELECT COUNT(*) 
FROM Rentals 
WHERE RentalDate IN (
	SELECT RentalDate 
	FROM Rentals 
	GROUP BY RentalDate 
	HAVING SUM(RentalCharge) = 0
);











