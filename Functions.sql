USE [Product]
GO

/****** Object:  UserDefinedFunction [dbo].[CalculateTotalAmountCreditCard]    Script Date: 12/1/2019 10:02:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CalculateTotalAmountCreditCard]
(
	-- Add the parameters for the function here
	@CreditCardID int
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = SUM(TotalPrice) FROM Invoice
	WHERE  FK_CreditcardID = @CreditCardID

	-- Return the result of the function
	RETURN @ResultVar

END
GO


/****** Object:  UserDefinedFunction [dbo].[CalculateTotalAmountCustomer]    Script Date: 12/1/2019 10:02:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CalculateTotalAmountCustomer]
(
	-- Add the parameters for the function here
	@CustomerID int
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal

	-- Add the T-SQL statements to compute the return value here
	SELECT @ResultVar = SUM(TotalAmount) FROM CreditCard
	WHERE  FK_CustomerID = @CustomerID

	-- Return the result of the function
	RETURN @ResultVar

END
GO

/****** Object:  UserDefinedFunction [dbo].[CalculateTotalPrice]    Script Date: 12/1/2019 10:03:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CalculateTotalPrice] 
(
	-- Add the parameters for the function here
	@InvoiceId int
)
RETURNS decimal
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal

	-- Add the T-SQL statements to compute the return value here
	
	SELECT @ResultVar = SUM(Quantity * UnitPrice) 
	FROM InvoiceLine
	LEFT JOIN Product ON Product.ProductID = InvoiceLine.FK_ProductID
	WHERE FK_InvoiceID = @InvoiceId

	-- Return the result of the function
	RETURN @ResultVar

END
GO

/****** Object:  UserDefinedFunction [dbo].[GetAverageRating]    Script Date: 12/1/2019 10:03:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetAverageRating](@productId INT)
RETURNS float
AS
BEGIN
	DECLARE @ResultVar float

	SELECT @ResultVar = SUM(CAST(Value AS float)) / COUNT(Value)
	FROM Rating 
	WHERE FK_ProductID = @productId

	RETURN @ResultVar
END
GO

ALTER TABLE [dbo].[Customer]
   DROP COLUMN [TotalAmount]
ALTER TABLE [dbo].[Customer]
   ADD [TotalAmount]  AS ([dbo].[CalculateTotalAmountCustomer]([CustomerID]))

ALTER TABLE [dbo].[CreditCard]
   DROP COLUMN [TotalAmount]
GO

ALTER TABLE [dbo].[CreditCard]
   ADD [TotalAmount]  AS ([dbo].[CalculateTotalAmountCreditCard]([CreditCardID]))

GO
ALTER TABLE [dbo].[Invoice]
   DROP COLUMN [TotalPrice]
GO
ALTER TABLE [dbo].[Invoice]
   ADD [TotalPrice]  AS ([dbo].[CalculateTotalPrice]([InvoiceId]))

GO
ALTER TABLE [dbo].[Invoice]
   DROP COLUMN [TAX]
GO
ALTER TABLE [dbo].[Invoice]
   ADD [TAX]  AS ([dbo].[CalculateTotalPrice]([InvoiceId])*(0.25))

GO
ALTER TABLE [dbo].[Product]
   DROP COLUMN [Average_Rating]
GO
ALTER TABLE [dbo].[Product]
   ADD [Average_Rating] AS ([dbo].[GetAverageRating]([ProductID]))
