-- Drop the function if it exists
IF OBJECT_ID('dbo.fn_GetAvailablePropertiesByCity', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_GetAvailablePropertiesByCity;
GO

-- Create the function
CREATE FUNCTION dbo.fn_GetAvailablePropertiesByCity (
    @City NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
    SELECT 
        pd.PropertyID,
        a.City,
        pd.Size,
        pd.Bedrooms,
        pd.Bathrooms,
        ss.Availability
    FROM dim_PropertyDetails pd
    JOIN dim_Addresses a ON pd.AddressID = a.AddressID
    JOIN fact_SalesStatus ss ON pd.PropertyID = ss.PropertyID
    WHERE ss.Availability = 'Available' AND a.City = @City;
GO
