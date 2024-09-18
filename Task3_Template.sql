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
	CategoryID INT NOT NULL,
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
	('P02', 'Summer Flash Sale', 40.0);
INSERT INTO Promotion VALUES
	('P03', 'Anniversary Special', 90.0);
INSERT INTO Promotion VALUES
	('P04', 'New Year’s Countdown Sale', 20.0);
INSERT INTO Promotion VALUES
	('P05', 'Mid-Year Clearance Sale', 60.0);
INSERT INTO Promotion VALUES
	('P06', 'Black Friday Sale', 70.0);
INSERT INTO Category VALUES
	('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source");
  
    
select *
from Promotion;
    
-- Question-B
/* Explain in simple words what each query does and make sure you comment it
 */

-- An example of an answer to a Query

/* This query prints the names of all chocolates */

Select ChocolateName
from Chocolate;


-- Query 1: A query involving a single table with one condition. Insert your answer below
SELECT ChocolateName
FROM Chocolate
WHERE ChocolatePrice > 10.00;


-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
SELECT CustomerName, CustomerEmail
FROM Customer
WHERE CustomerName LIKE 'J%' AND CustomerEmail LIKE '%.com';


-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
SELECT Chocolate.ChocolateName, Review.ReviewRating
FROM Review
JOIN Chocolate ON Review.ChocolateID = Chocolate.ChocolateID
ORDER BY Review.ReviewRating DESC;


-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
SELECT CategoryID, AVG(ChocolatePrice) AS AvgPrice
FROM Chocolate
GROUP BY CategoryID;
