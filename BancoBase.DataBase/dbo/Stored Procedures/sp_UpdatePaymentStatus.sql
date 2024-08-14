
CREATE PROCEDURE [dbo].[sp_UpdatePaymentStatus]
@ID uniqueidentifier,
@StatusID int
AS 
BEGIN
UPDATE [dbo].[Payments]
   SET [StatusID] = @StatusID
 WHERE ID = @ID;
END