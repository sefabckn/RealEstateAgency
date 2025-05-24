-- View 1: Available Properties by City (with aggregation)
DROP VIEW IF EXISTS View_AvailablePropertiesByCity;
GO
CREATE VIEW View_AvailablePropertiesByCity AS
SELECT
    a.City,
    COUNT(*) AS AvailableProperties
FROM
    fact_SalesStatus s
JOIN dim_PropertyDetails p ON s.PropertyID = p.PropertyID
JOIN dim_Addresses a ON p.AddressID = a.AddressID
WHERE
    s.Availability = 'Available'
GROUP BY
    a.City;
GO

-- View 2: Average Price per Bedroom
DROP VIEW IF EXISTS View_AveragePricePerBedroom;
GO
CREATE VIEW View_AveragePricePerBedroom AS
SELECT
    p.Bedrooms,
    AVG(pi.Price) AS AvgPrice
FROM
    fact_PriceInformation pi
JOIN dim_PropertyDetails p ON pi.PropertyID = p.PropertyID
GROUP BY
    p.Bedrooms;
GO

-- View 3: Properties Sold by Each Salesperson
DROP VIEW IF EXISTS View_PropertiesSoldBySalesperson;
GO
CREATE VIEW View_PropertiesSoldBySalesperson AS
SELECT
    sp.FirstName,
    sp.LastName,
    COUNT(s.SalesID) AS PropertiesSold
FROM
    fact_SalesStatus s
JOIN dim_SalesPerson sp ON s.SalesmanID = sp.SalesmanID
WHERE
    s.Availability = 'Sold'
GROUP BY
    sp.FirstName, sp.LastName;
GO

-- View 4: Properties for Sale in Warsaw
DROP VIEW IF EXISTS View_PropertiesForSale_Warsaw;
GO
CREATE VIEW View_PropertiesForSale_Warsaw AS
SELECT
    p.PropertyID,
    a.City,
    pi.Price,
    s.ForSale
FROM
    dim_PropertyDetails p
JOIN dim_Addresses a ON p.AddressID = a.AddressID
JOIN fact_SalesStatus s ON p.PropertyID = s.PropertyID
JOIN fact_PriceInformation pi ON p.PropertyID = pi.PropertyID
WHERE
    a.City = 'Warsaw' AND s.ForSale = 1;
GO
