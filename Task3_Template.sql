-- Question-A
-- Table Creation (Incomplete and Erroneous - please fix the errors and complete this section)

CREATE TABLE Promotion (
	PromoID CHAR(3) NOT NULL,
	PromoName VARCHAR(50) NOT NULL,
	PromoDiscount DECIMAL(4,1) NOT NULL,
    PRIMARY KEY (PromoID)
);

CREATE TABLE Category (
	CategoryID CHAR(5) NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	CategoryDesc VARCHAR(200) NOT NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Chocolate (
	ChocolateID CHAR(6) NOT NULL,
	ChocolateName VARCHAR(50) NOT NULL,
	ChocolateDesc VARCHAR(200) NOT NULL,
	ChocolatePrice DECIMAL (5, 2) NOT NULL,
	ChocolateWeight INT NOT NULL,
	CategoryID char(5) NOT NULL,
	PRIMARY KEY (ChocolateID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE Chocolate (
    ChocolateID CHAR(6) NOT NULL,
    ChocolateName VARCHAR(50) NOT NULL,
    ChocolateDesc VARCHAR(200) NOT NULL,
    ChocolatePrice DECIMAL(5, 2) NOT NULL,
    ChocolateWeight INT NOT NULL,
    CategoryID CHAR(5) NOT NULL,
    PRIMARY KEY (ChocolateID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Discount (
    PromotionID CHAR(3) NOT NULL,
    ChocolateID CHAR(6) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    PRIMARY KEY (PromotionID, ChocolateID),
	FOREIGN KEY (PromotionID) REFERENCES Promotion(PromoID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);


CREATE TABLE Customer (
    CustomerID CHAR(6) NOT NULL,
    CustomerName VARCHAR(70) NOT NULL,
    CustomerEmail VARCHAR(100) NOT NULL,
    CustomerPhNum VARCHAR(32) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Review (
    ReviewID CHAR(6) NOT NULL,
    ReviewRating DECIMAL(2, 0) NOT NULL,
    ReviewComment VARCHAR(255) NOT NULL,
    ReviewDate DATETIME NOT NULL,
    CustomerID CHAR(6) NULL,
    ChocolateID CHAR(6) NOT NULL,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);
-- Once successfully implemented, these insert statements should work.

INSERT INTO Promotion VALUES
	('P01', "Opening Sale", 50.0);

INSERT INTO Category VALUES
	('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source");

INSERT INTO Chocolate VALUES
	('CHOC13', "Dark Chocolate Tablet", "Small, bite sized dark chocolate tablets", 17.99, 80, 'CAT01');

INSERT INTO Discount VALUES
	('P01', 'CHOC13', '2023-02-01 08:00:00', '2023-02-02 18:00:00');

INSERT INTO Customer VALUES
	('CUS145', "Jon Snow", "j.snow@notreal.com",  "90861923");

INSERT INTO Review VALUES
	('REV131', 8, "A delicious milk chocolate", '2023-02-02 13:22:54', 'CUS145','CHOC13');

-- Please ensure you INSERT atleast 5 records for every table and add it below

INSERT INTO Promotion VALUES
	('P02', 'Summer Sale', 30.0);
INSERT INTO Promotion VALUES
	('P03', 'Christmas Special', 70.0);
INSERT INTO Promotion VALUES
	('P04', 'New Year’s Countdown Sale', 50.0);
INSERT INTO Promotion VALUES
	('P05', 'Mid-Year Sale', 60.0);
INSERT INTO Promotion VALUES
	('P06', 'Black Friday Sale', 70.0);
    
INSERT INTO Category VALUES
    ('CAT01', 'Piura Porcelana ', 'Cocoa beans from Swiss'),
    ('CAT02', 'Cacaosuyo Piura', '70% dark chocolate comes from Peru'),
    ('CAT03', 'Ghana Milk', 'Smooth milk chocolate from Ghana'),
    ('CAT04', 'Parlor Cocoa', 'Premium cocoa sourced from California'),
    ('CAT05', 'Amano Madagascar', 'Unique white chocolate bar from Madagascar');

INSERT INTO Chocolate VALUES
    ('CHOC13', 'Dark Chocolate', 'Bite-sized dark chocolate bar', 16.99, 80, 'CAT01'),
    ('CHOC14', 'Half Milk Chocolate', 'Classic milk chocolate bar', 5.99, 100, 'CAT03'),
    ('CHOC15', 'White Chocolate Truffles', 'Delicate white chocolate truffles', 24.99, 120, 'CAT05'),
    ('CHOC16', 'Semisweeet Chocolate', 'Slightly smoky but well-balanced', 12.99, 90, 'CAT02'),
    ('CHOC17', 'Milk Chocolate', 'Silky milk chocolate with a hint of caramel', 9.99, 85, 'CAT04');

INSERT INTO Discount VALUES
    ('P01', 'CHOC13', '2022-06-13 10:00:00', '2023-07-12 18:00:00'),
    ('P02', 'CHOC14', '2022-12-06 09:00:00', '2023-01-05 17:00:00'),
    ('P03', 'CHOC15', '2023-04-15 06:00:00', '2023-06-20 12:00:00'),
    ('P04', 'CHOC16', '2023-10-24 07:00:00', '2023-08-12 16:00:00'),
    ('P05', 'CHOC17', '2023-12-23 10:00:00', '2024-01-09 23:00:00');

INSERT INTO Customer VALUES
    ('CUS146', 'Emily Snow', 'emily.snow2@gamil.com', '399806323'),
    ('CUS147', 'John Wason', 'john.wason63@gmail.com', '045677525'),
    ('CUS148', 'Shara Tara', 'shara.tara@gamil.com', '049157159'),
    ('CUS149', 'Oliver William', 'oliver.william@gamil.com', '826335755'),
    ('CUS150', 'Steve Stark', 'steve.stark32@gmail.com', '839955392');

INSERT INTO Review VALUES
    ('REV132', 8, 'Very delicious dark chocolate', '2021-09-02 13:22:54', 'CUS145', 'CHOC13'),
    ('REV133', 9, 'Smooth milk chocolate', '2021-10-06 10:22:54', 'CUS146', 'CHOC14'),
    ('REV134', 7, 'Sweet white cream truffles', '2023-04-16 09:12:45', 'CUS147', 'CHOC15'),
    ('REV135', 10, 'Smooth texture and a beautifully balanced', '2023-07-18 12:45:30', 'CUS148', 'CHOC16'),
    ('REV136', 9, 'Very smooth and creamy', '2022-10-02 14:32:12', 'CUS149', 'CHOC17');
select *
from Cholocalate;

-- Question-B
/* Explain in simple words what each query does and make sure you comment it*/
-- An example of an answer to a Query
/* This query prints the names of all chocolates */

Select ChocolateName
from Chocolate;


-- Query 1: A query involving a single table with one condition. Insert your answer below
SELECT ChocolateName
FROM Chocolate
WHERE ChocolatePrice > 10.00;
-- This query selects and prints those chocolate names whose price is greater than $10. 


-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
SELECT CustomerName, CustomerEmail
FROM Customer
WHERE CustomerName LIKE 'J%' AND CustomerEmail LIKE '%.com';
-- This query selects and prints those Customers whose name starts with "J" and email ends with ".com"


-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
SELECT Chocolate.ChocolateName, Review.ReviewRating
FROM Review
JOIN Chocolate ON Review.ChocolateID = Chocolate.ChocolateID
ORDER BY Review.ReviewRating DESC;
-- This query selects chocolate name and review rating by joining the review and chocolate tables. It then prints the result of review rating in descending order.

-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
SELECT CategoryID, AVG(ChocolatePrice) AS AvgPrice
FROM Chocolate
GROUP BY CategoryID;
-- This query groups chocolate by categoryID and then calculates the average price of each chocolate. Its result would show categoryID and average of prices.
