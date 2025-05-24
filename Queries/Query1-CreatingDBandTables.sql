DROP DATABASE IF EXISTS realestate;
GO
CREATE DATABASE realestate;


use realestate

DROP TABLE IF EXISTS fact_SalesStatus;
DROP TABLE IF EXISTS fact_PriceInformation;
DROP TABLE IF EXISTS dim_PropertyDetails;
DROP TABLE IF EXISTS dim_Addresses;
DROP TABLE IF EXISTS dim_SalesPerson;
DROP TABLE IF EXISTS dim_Offices;

CREATE TABLE dim_Addresses (
    AddressID INT PRIMARY KEY,
    Country NVARCHAR(50),
    City NVARCHAR(50),
    PostCode NVARCHAR(10),
    CHECK (LEN(PostCode) >= 4)
);

CREATE TABLE dim_Offices (
    OfficeID INT PRIMARY KEY,
    Country NVARCHAR(50),
    City NVARCHAR(50)
);

CREATE TABLE dim_SalesPerson (
    SalesmanID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    OfficeID INT FOREIGN KEY REFERENCES dim_Offices(OfficeID)
);

CREATE TABLE dim_PropertyDetails (
    PropertyID INT PRIMARY KEY,
    AddressID INT FOREIGN KEY REFERENCES dim_Addresses(AddressID),
    Size INT CHECK (Size > 10),
    Bedrooms INT CHECK (Bedrooms >= 0),
    Bathrooms INT CHECK (Bathrooms >= 0),
    Garage BIT
);

CREATE TABLE fact_PriceInformation (
    PriceID INT PRIMARY KEY,
    PropertyID INT FOREIGN KEY REFERENCES dim_PropertyDetails(PropertyID),
    Price DECIMAL(12, 2) CHECK (Price > 0),
    Currency NVARCHAR(3) CHECK (Currency IN ('USD', 'EUR', 'PLN')),
    AddedDate DATE
);

CREATE TABLE fact_SalesStatus (
    SalesID INT PRIMARY KEY,
    PropertyID INT FOREIGN KEY REFERENCES dim_PropertyDetails(PropertyID),
    ForSale BIT,
    Availability NVARCHAR(20) CHECK (Availability IN ('Available', 'Sold', 'Rented')),
    SalesmanID INT FOREIGN KEY REFERENCES dim_SalesPerson(SalesmanID),
    SoldDate DATE
);



