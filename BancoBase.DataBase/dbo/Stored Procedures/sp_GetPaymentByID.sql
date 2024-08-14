
CREATE PROCEDURE [dbo].[sp_GetPaymentByID]
@ID uniqueidentifier
AS 
BEGIN
SELECT [ID]
      ,[Concept]
      ,[QtyProducts]
      ,[From]
      ,[Total]
      ,[StatusID]
	  ,[CreatedOn]
	  ,[UpdatedOn]
  FROM [dbo].[Payments]
  WHERE ID = @ID;

END