-- dimensions
INSERT INTO dim_Addresses (AddressID, Country, City, PostCode) VALUES
(1, 'Poland', 'Warsaw', '00-001'),
(2, 'Poland', 'Krakow', '30-002'),
(3, 'Germany', 'Berlin', '10115');

INSERT INTO dim_Offices (OfficeID, Country, City) VALUES
(1, 'Poland', 'Warsaw'),
(2, 'Poland', 'Krakow'),
(3, 'Germany', 'Berlin');


INSERT INTO dim_SalesPerson (SalesmanID, FirstName, LastName, OfficeID) VALUES
(1, 'Anna', 'Kowalska', 1),
(2, 'Tomasz', 'Nowak', 2),
(3, 'Lena', 'Schmidt', 3);


INSERT INTO dim_PropertyDetails (PropertyID, AddressID, Size, Bedrooms, Bathrooms, Garage) VALUES
(101, 1, 85, 3, 2, 1),
(102, 2, 60, 2, 1, 0),
(103, 3, 120, 4, 2, 1);


-- Fact Tables
INSERT INTO fact_PriceInformation (PriceID, PropertyID, Price, Currency, AddedDate) VALUES
(1001, 101, 850000.00, 'PLN', '2025-01-01'),
(1002, 102, 600000.00, 'PLN', '2025-02-15'),
(1003, 103, 250000.00, 'EUR', '2025-03-10');


INSERT INTO fact_SalesStatus (SalesID, PropertyID, ForSale, Availability, SalesmanID, SoldDate) VALUES
(201, 101, 0, 'Sold', 1, '2025-02-01'),
(202, 102, 1, 'Available', 2, NULL),
(203, 103, 1, 'Available', 3, NULL);
