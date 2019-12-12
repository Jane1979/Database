USE [Product]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 12/1/2019 10:07:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[PhoneNo] [int] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[TotalAmount] [float],
 CONSTRAINT [PK__Customer__A4AE64B85FFC5D60] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CreditCard](
	[CreditCardID] [int] IDENTITY(1,1) NOT NULL,
	[IBANCode] [nvarchar](18) NOT NULL,
	[CreditCardName] [nvarchar](22) NOT NULL,
	[CreditCardNumber] [bigint] NOT NULL,
	[CreditCardMonth] [int] NOT NULL,
	[CreditCardYear] [int] NOT NULL,
	[CCV] [int] NOT NULL,
	[FK_CustomerID] [int] NOT NULL,
	[TotalAmount]  [float],
 CONSTRAINT [PK__CreditCa__6EB1F510E9E1EB0A] PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CreditCard]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Customer] FOREIGN KEY([FK_CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[CreditCard] CHECK CONSTRAINT [FK_CreditCard_Customer]
GO

/****** Object:  Table [dbo].[Invoice]    Script Date: 12/1/2019 10:09:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[TotalPrice]  [float],
	[TAX]  [float],
	[FK_CreditCardID] [int] NOT NULL,
 CONSTRAINT [PK__Invoice__D796AAB59FCBA10B] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_CreditCard] FOREIGN KEY([FK_CreditCardID])
REFERENCES [dbo].[CreditCard] ([CreditCardID])
GO

ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_CreditCard]
GO


/****** Object:  Table [dbo].[Product]    Script Date: 12/1/2019 10:10:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](40) NOT NULL,
	[Description] [ntext] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Average_Rating]  [float],
 CONSTRAINT [PK__Product__B40CC6EDF03588C2] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InvoiceLine]    Script Date: 12/1/2019 10:10:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InvoiceLine](
	[InvoiceLineID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[FK_ProductID] [int] NOT NULL,
	[FK_InvoiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Invoice] FOREIGN KEY([FK_InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO

ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_Invoice]
GO

ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Product] FOREIGN KEY([FK_ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO

ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK_InvoiceLine_Product]
GO

/****** Object:  Table [dbo].[Rating]    Script Date: 12/1/2019 10:11:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rating](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[Comment] [ntext] NOT NULL,
	[FK_CustomerID] [int] NOT NULL,
	[FK_ProductID] [int] NOT NULL,
 CONSTRAINT [PK__Rating__FCCDF87C9501D21B] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Customer] FOREIGN KEY([FK_CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Customer]
GO

ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product] FOREIGN KEY([FK_ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO

ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product]
GO