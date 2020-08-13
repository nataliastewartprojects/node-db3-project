-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM product as p
JOIN category as c
on p.categoryId = c.id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName
FROM [order] as o LEFT JOIN shipper as s
on s.id = o.ShipVia
WHERE o.OrderDate < "2012-08-09"


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.


SELECT Product.ProductName, OrderDetail.Quantity
FROM Product
JOIN OrderDetail ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id, c.CompanyName, e.LastName
FROM [Order] as o
JOIN Customer as c on o.CustomerId = c.Id
JOIN Employee as e
on o.EmployeeId = e.Id 
