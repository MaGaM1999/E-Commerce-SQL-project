/*
   our SQL project is creating a comprehensive and efficient database for an E-commerce website
   and Our SQL database consisting of seven tables: Customers, Addresses, Categories, Products, Cart, CartItems, and Wishlist 
*/


CREATE TABLE Customers (
	ID INT NOT NULL,
    FirstName VARCHAR(15) NOT NULL,
    LastName VARCHAR(15) NOT NULL,
	Birthday DATE NOT NULL,
    Phone VARCHAR(13) NOT NULL,
    Email VARCHAR(MAX) NOT NULL,
	Gender VARCHAR(6) NOT NULL,
    PRIMARY KEY (ID) 
);

INSERT INTO Customers (ID, FirstName, LastName, Birthday, Phone, Email, Gender) VALUES (1, 'Mostafa', 'Lotfy', '16-NOV-1999', '01146755203', 'Mostafa@gmail.com', 'Male');
INSERT INTO Customers (ID, FirstName, LastName, Birthday, Phone, Email, Gender) VALUES (2, 'Sara', 'Eslam', '1985-07-22', '0104325621', 'sara@gmail.com', 'Female');
INSERT INTO Customers (ID, FirstName, LastName, Birthday, Phone, Email, Gender) VALUES (3, 'Ali', 'Mohamed', '1990-03-10', '1234567890', 'ali@gmail.com', 'Male');

SELECT * FROM Customers  /*This Query use to get all available customer information from the database */  


SELECT * FROM Customers WHERE FirstName = 'Mostafa'  /*This Query use to get all available customer information based on their first name which called mostafa*/ 

SELECT * FROM Customers WHERE Gender = 'Male'  /* This query used to segment our customers data based on their gender and choose Male only */    

SELECT * FROM Customers ORDER BY Gender  /* This query used to view the customers data in a specific order and sorting them by gender */  

SELECT * FROM Customers WHERE Birthday LIKE '%1999%'   /* This query used for searching for customer records with a specific year which is 1999 */ 

SELECT * FROM Customers WHERE FirstName LIKE '%mo%'     /* This query used for searching for customer record who his first name start with mo */

CREATE TABLE Addresses (
	AddressID INT NOT NULL,
	CustomerID INT NOT NULL,
	Country VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Address TEXT NOT NULL,
    PRIMARY KEY (AddressID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
);

INSERT INTO Addresses (AddressID, CustomerID, Country, City, Address) VALUES (1, 1, 'Egypt', 'Cairo', 'Madinaty, B10, Building 67, f4');
INSERT INTO Addresses (AddressID, CustomerID, Country, City, Address) VALUES (2, 2, 'Egypt', 'Cairo', 'Ring Road Meerag City, Maadi');
INSERT INTO Addresses (AddressID, CustomerID, Country, City, Address) VALUES (3, 3, 'Egypt', 'Alexandria', 'El-Shaheed Galal El-Desouky, Bab Sharqi WA Wabour Al Meyah'); 

SELECT * FROM Addresses   /*This Query use to get all available addresses information from the database */ 

SELECT * FROM Addresses WHERE CustomerID = 1   /*This Query use to get all information based on CustomerID whose CustomerID number is 1 */ 

SELECT * FROM Addresses WHERE Country = 'Egypt'  /* This query used to get to access address record for customers in a specific country which is Egypt */

SELECT * FROM Addresses ORDER BY AddressID    /* This query used to view the addresses data in a specific order and sorting it by AddressID */

SELECT * FROM Addresses WHERE City LIKE '%Alex%' /* this query search for city that start with Alex in addresses table */  

SELECT ID, FirstName, LastName, Gender FROM (Customers INNER JOIN Addresses ON CustomerID = ID)

CREATE TABLE Categories (
	CategoryID INT NOT NULL,
	CategoryName VARCHAR NOT NULL,
	PRIMARY KEY (CategoryID),
);

INSERT INTO Categories (CategoryID, CategoryName) VALUES (1, 'Mobile Phones');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (2, 'Accessories');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (3, 'Fashion');

SELECT * FROM Categories  /* This Query use to get all available Categories information from the database */ 

SELECT * FROM Categories WHERE CategoryID = 1  /*This Query use to get all information based on CategoryID when CategoryID number is 1 */

SELECT * FROM Categories WHERE CategoryName = 'Mobile Phones'   /*This Query use to get all information based on CategoryName when CategoryName is Mobile Phones */

SELECT * FROM Categories ORDER BY CategoryID    /* This query used to view the Categories data in a specific order and sorting it by CategoryID  */

SELECT * FROM Categories WHERE CategoryName LIKE '%Mobile%'   /* this query search for CategoryName that start with Mobile in Categories table */ 

CREATE TABLE Products (
	ProductID INT NOT NULL,
	ProductName TEXT NOT NULL,
	CategoryID INT NOT NULL,
	Price FLOAT NOT NULL,
	SpecialPrice FLOAT NOT NULL,
	Quantity INT NOT NULL,
	Description TEXT NOT NULL,
	PRIMARY KEY (ProductID),
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductID, ProductName, CategoryID, Price, SpecialPrice, Quantity, Description) VALUES (1, 'Samsung', 1, 1200, 1000, 50, 'BODY Dimensions: 164.2 x 75.9 x 9.1 mm (6.46 x 2.99 x 0.36 in)');
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, SpecialPrice, Quantity, Description) VALUES (2, 'Jewelry Box', 2, 1000, 800, 20, '23.1 x 18.5 x 5.4 cm; 310 Grams');
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, SpecialPrice, Quantity, Description) VALUES (3, 'Men T Shirt R RGLR Basic', 3, 2000, 1900, 30, 'They come in various colors, patterns, and designs, allowing individuals to express their personal style and interests');

SELECT * FROM Products  /* This Query use to get all available products information from the database */ 

SELECT * FROM Products WHERE ProductID = 1   /*This Query use to get all information based on ProductID when ProductID number is 1 */

SELECT * FROM Products WHERE ProductName = 'Samsung'   /*This Query use to get all information based on ProductName when ProductName is Samsung */

SELECT * FROM Products ORDER BY CategoryID     /* This query used to view the Products data in a specific order and sorting it by CategoryID  */

SELECT * FROM Products WHERE ProductName LIKE '%Box%'  /* this query search for ProductName that contain Box in Products table */ 

SELECT ProductID, ProductName, Price FROM (Products JOIN Categories ON Categories.CategoryID = Products.CategoryID) WHERE Categories.CategoryID = 1
/*this SQL query get  ProductID,ProductName and Price for specific product information for item that belong to CategoryID 1 
and It combines data from the "Products" and "Categories" tables through join based on CategoryID when equal 1 */   


SELECT ProductID, ProductName, Price FROM (Products INNER JOIN Categories ON Categories.CategoryID = Products.CategoryID) WHERE Categories.CategoryID = 2
/*this SQL query get  ProductID,ProductName and Price for specific product information for item that belong to CategoryID 2
and It combines data from the "Products" and "Categories" tables through inner join based on CategoryID when equal 2 */ 


SELECT MAX(Price), MIN(Price), AVG(Price) FROM Products  /*this query get the maximum, minimum, and average values for the Price column from the Products table */ 

SELECT MAX(Price), MIN(Price), AVG(Price) FROM Products WHERE CategoryID = 1   /*this query get the maximum, minimum, and average Price for specific categoryID which is 1 */  

SELECT COUNT(*) FROM Products WHERE CategoryID = 1 /*  this query counts the records in the Products table where the CategoryID is set to 1 */ 

CREATE TABLE Cart (
	CartID INT NOT NULL,
	CustomerID INT NOT NULL,
	PRIMARY KEY (CartID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
);

INSERT INTO Cart (CartID, CustomerID) VALUES (1, 1);
INSERT INTO Cart (CartID, CustomerID) VALUES (2, 2);
INSERT INTO Cart (CartID, CustomerID) VALUES (3, 3);

CREATE TABLE CartItems (
	CartItemID INT NOT NULL,
	CartID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (CartItemID),
	FOREIGN KEY (CartID) REFERENCES Cart(CartID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity) VALUES (1, 1, 1, 1);
INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity) VALUES (2, 2, 2, 4);
INSERT INTO CartItems (CartItemID, CartID, ProductID, Quantity) VALUES (3, 3, 3, 3);

CREATE TABLE Wishlist (
	WishlistID INT NOT NULL,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	PRIMARY KEY (WishlistID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(ID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (1, 1, 1);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (2, 1, 2);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (3, 1, 3);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (4, 2, 1);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (5, 2, 2);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (6, 2, 3);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (7, 3, 1);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (8, 3, 2);
INSERT INTO Wishlist (WishlistID, CustomerID, ProductID) VALUES (9, 3, 3); 