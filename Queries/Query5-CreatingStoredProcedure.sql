CREATE PROCEDURE sp_UpdateAvailability
    @PropertyID INT,
    @NewAvailability NVARCHAR(20)
AS
BEGIN
    UPDATE fact_SalesStatus
    SET Availability = @NewAvailability
    WHERE PropertyID = @PropertyID;

    IF @NewAvailability = 'Sold'
        PRINT 'Property marked as Sold.';
    ELSE IF @NewAvailability = 'Rented'
        PRINT 'Property marked as Rented.';
    ELSE
        PRINT 'Availability updated.';
END;
