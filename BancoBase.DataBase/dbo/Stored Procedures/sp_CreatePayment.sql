
create PROCEDURE [dbo].[sp_CreatePayment]
@ID uniqueidentifier,
@Concept nvarchar(255),
@QtyProducts int,
@From nvarchar(10),
@To nvarchar(10),
@Total money,
@StatusID int
AS 
BEGIN
INSERT INTO [dbo].[Payments]
           ([ID]
           ,[Concept]
           ,[QtyProducts]
           ,[From]
           ,[To]
           ,[Total]
           ,[StatusID])
     VALUES
           (@ID,
			@Concept,
			@QtyProducts,
			@From,
			@To,
			@Total,
			@StatusID)
END