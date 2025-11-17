--Create Database
Create database Zepto
use zepto

--Create a SQL table
Drop Table if exists ProductDetails
CREATE TABLE ProductDetails (
    Category               VARCHAR(100),
    Name                   VARCHAR(255),
    MRP                    INT,
    DiscountPercent        INT,
    AvailableQuantity      INT,
    DiscountedSellingPrice INT,
    WeightInGms            INT,
    OutOfStock             VARCHAR(100),
    Quantity               INT
);

--Bulk Upload data from csv to ProductDetails Table
BULK INSERT ProductDetails
FROM 'C:\zepto_v2.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIELDQUOTE = '"',
    FIRSTROW = 2
);

select * from ProductDetails