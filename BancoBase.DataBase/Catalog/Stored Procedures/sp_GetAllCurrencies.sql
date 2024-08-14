

CREATE PROCEDURE [Catalog].[sp_GetAllCurrencies]
AS 
BEGIN
SELECT [ID]
      ,[Name]
  FROM [Catalog].[Currency];
END