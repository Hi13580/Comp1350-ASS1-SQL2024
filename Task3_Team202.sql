/*
Comp1350 Assignment 1 task 3 Team 202, 2024
Student ID  Student Name
47856254    Priyanka Priyanka
48161926    Rahul Kumar
48588466    Fahmida Alam
48516589    Minying wu

*/
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
	('P01', 'CHOC13', '2022-05-04 08:00:00', '2022-06-02 20:00:00');

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
    ('CAT02', 'Piura Porcelana ', 'Cocoa beans from Swiss'),
    ('CAT03', 'Cacaosuyo Piura', '70% dark chocolate comes from Peru'),
    ('CAT04', 'Ghana Milk', 'Smooth milk chocolate from Ghana'),
    ('CAT05', 'Parlor Cocoa', 'Premium cocoa sourced from California'),
    ('CAT06', 'Amano Madagascar', 'Unique white chocolate bar from Madagascar');

INSERT INTO Chocolate VALUES
    ('CHOC14', 'Dark Honey Chocolate', 'Dark Sweet chocolate bar', 16.99, 75, 'CAT06'),
    ('CHOC15', 'Half Milk Chocolate', 'Classic milk chocolate bar', 5.99, 65, 'CAT03'),
    ('CHOC16', 'White Chocolate Truffles', 'Delicate white chocolate truffles', 24.99, 70, 'CAT05'),
    ('CHOC17', 'Semisweeet Chocolate', 'Slightly smoky but well-balanced', 12.99, 90, 'CAT02'),
    ('CHOC18', 'Milk Chocolate', 'Silky milk chocolate with a hint of caramel', 9.99, 55, 'CAT04');

INSERT INTO Discount VALUES
    ('P02', 'CHOC14', '2022-06-13 10:00:00', '2023-07-12 18:00:00'),
    ('P03', 'CHOC15', '2022-12-06 09:00:00', '2023-01-05 17:00:00'),
    ('P04', 'CHOC16', '2023-04-15 06:00:00', '2023-06-20 12:00:00'),
    ('P05', 'CHOC17', '2023-10-24 07:00:00', '2023-08-12 16:00:00'),
    ('P06', 'CHOC18', '2023-12-23 10:00:00', '2024-01-09 23:00:00');

INSERT INTO Customer VALUES
    ('CUS146', 'Emily Snow', 'emily.snow2@gmail.com', '399806323'),
    ('CUS147', 'John Wason', 'john.wason63@gmail.com', '045677525'),
    ('CUS148', 'Shara Tara', 'shara.tara@gmail.com', '049157159'),
    ('CUS149', 'Oliver William', 'oliver.william@gmail.com', '826335755'),
    ('CUS150', 'Steve Stark', 'steve.stark32@gmail.com', '839955392');

INSERT INTO Review VALUES
    ('REV132', 8, 'Outstanding taste with this dark chocolate', '2021-09-02 13:22:54', 'CUS145', 'CHOC13'),
    ('REV133', 9, 'Smooth milk chocolate', '2021-10-06 10:22:54', 'CUS146', 'CHOC14'),
    ('REV134', 7, 'Sweet white cream truffles', '2023-04-16 09:12:45', 'CUS147', 'CHOC15'),
    ('REV135', 10, 'Smooth texture and a beautifully balanced', '2023-07-18 12:45:30', 'CUS148', 'CHOC16'),
    ('REV136', 9, 'Very smooth and creamy', '2023-10-02 14:32:12', 'CUS149', 'CHOC17');
select *
from Chocolate;


/*
-- check A
Select ReviewID, ReviewRating, ReviewComment, ReviewDate, CustomerID, ChocolateID
from Review;

Select CustomerID, CustomerName, CustomerEmail, CustomerPhNum
from Customer;

Select PromotionID, ChocolateID, StartDate, EndDate
from Discount;

Select ChocolateID, ChocolateName, ChocolateDesc, ChocolatePrice,ChocolateWeight,CategoryID
from Chocolate;

Select CategoryID, CategoryName, CategoryDesc
from Category;

Select PromoID, PromoName, PromoDiscount
from Promotion;

DESCRIBE Customer;
ALTER TABLE Customer
DROP COLUMN CusDOB;

DROP TABLE Customer;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Discount;
TRUNCATE TABLE Review;
TRUNCATE TABLE Chocolate;
TRUNCATE TABLE Category;
TRUNCATE TABLE Promotion;
TRUNCATE TABLE Customer;
SET FOREIGN_KEY_CHECKS = 1;
*/


-- Question-B
/* Explain in simple words what each query does and make sure you comment it*/
-- An example of an answer to a Query
/* This query prints the names of all chocolates */
Select ChocolateName
from Chocolate;

-- Query 1: A query involving a single table with one condition. Insert your answer below
Select ChocolateName
from Chocolate
where ChocolatePrice>15.00;
-- This query selects and prints those chocolate names whose price is greater than $15. 


-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below
Select ChocolateName, ChocolatePrice
from Chocolate
where ChocolateName like '%Milk%' and ChocolatePrice<10.00;
-- This query selects and prints those Chocolates that have a name containing "Milk" and are priced below 10.00 

-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below
select Promotion.PromoName, Chocolate.ChocolateName, Discount.StartDate
from Discount
join Promotion on Discount.PromotionID = Promotion.PromoID
join Chocolate on Discount.ChocolateID = Chocolate.ChocolateID
order by Discount.StartDate;
-- This query selects the promotion names and chocolate names for discounts by joining promotion and chocolate on discount tables. It then print the ordered by the start date of the discount in descending order.

-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below
Select CategoryID, ROUND(AVG(ChocolatePrice), 0) as AvgPrice
from Chocolate
group by CategoryID;
-- This query groups chocolate by categoryID and then calculates the average price of each chocolate. Its result would show categoryID and average of prices.



