

CREATE PROCEDURE [Catalog].[sp_GetAllStatus]
AS 
BEGIN
SELECT [ID]
      ,[Name]
  FROM [Catalog].[Status];
END