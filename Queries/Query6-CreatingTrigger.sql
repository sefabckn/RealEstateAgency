CREATE TRIGGER trg_AutoUpdateForSale
ON fact_SalesStatus
AFTER UPDATE
AS
BEGIN
    UPDATE fact_SalesStatus
    SET ForSale = 0
    FROM fact_SalesStatus fs
    JOIN inserted i ON fs.SalesID = i.SalesID
    WHERE i.Availability = 'Sold';
END;



