Use [Product]
GO

CREATE TABLE Audit_Customer(
	AuditID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CustomerID INT NOT NULL,
	OldSurname NVARCHAR(150) NULL,
	NewSurname NVARCHAR(150) NULL,
	OldName NVARCHAR(150) NULL,
	NewName NVARCHAR(150) NULL,
	OldAdress NVARCHAR(255) NULL,
	NewAdress NVARCHAR(255) NULL,
	OldZipCode INT NULL,
	NewZipCode INT NULL,
	OldCity NVARCHAR(100) NULL,
	NewCity NVARCHAR(100) NULL,
	OldPhoneNo INT NULL,
	NewPhoneNo INT NULL,
	OldEmail NVARCHAR(150) NULL,
	NewEmail NVARCHAR(150) NULL,
	OldPassword NVARCHAR(255) NULL,
	NewPassword NVARCHAR(255) NULL,
	OldTotalAmount decimal NULL,
	NewTotalAmount decimal NULL,
	HostName nvarchar(128) NOT NULL,
	HostID INT NOT NULL,
	OperatingSystemUser nvarChar(20) NOT NULL,
	OperatingSystemID INT NOT NULL,
	updated_at DATETIME DEFAULT GETDATE() NOT NULL,
	operation NCHAR(6) NOT NULL,
)

GO

CREATE TABLE Audit_CreditCard(
	AuditID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CreditCardID INT NOT NULL,
	OldIBANCode NVARCHAR(50) NULL,
	NewIBANCode NVARCHAR(50) NULL,
	OldCreditCardName NVARCHAR(255) NULL,
	NewCreditCardName NVARCHAR(255) NULL,
	OldCreditCardNumber BIGINT NULL,
	NewCreditCardNumber BIGINT NULL,
	OldCreditCardMonth INT NULL,
	NewCreditCardMonth INT NULL,
	OldCreditCardYear INT NULL,
	NewCreditCardYear INT NULL,
	OldCCV INT NULL,
	NewCCV INT NULL,
	OldFK_CustomerID INT NULL,
	NewFK_CustomerID INT NULL,
	HostName nvarchar(128) NOT NULL,
	HostID INT NOT NULL,
	OperatingSystemUser nvarChar(20) NOT NULL,
	OperatingSystemID INT NOT NULL,
	updated_at DATETIME DEFAULT GETDATE() NOT NULL,
	operation NCHAR(6) NOT NULL,
)
GO

CREATE TRIGGER AuditCustomer
ON Customer
INSTEAD OF INSERT, UPDATE, DELETE
AS 
	BEGIN
	DECLARE @operation CHAR(6)
		SET @operation = CASE
				WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
					THEN 'Update'
				WHEN EXISTS(SELECT * FROM inserted)
					THEN 'Insert'
				WHEN EXISTS(SELECT * FROM deleted)
					THEN 'Delete'
				ELSE NULL

		END
	IF @operation = 'Delete'
			INSERT INTO Audit_Customer(CustomerID, OldSurname, OldName, OldAdress, OldZipCode, OldCity, OldPhoneNo, OldEmail, OldPassword, OldTotalAmount, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT d.CustomerID, d.Surname, d.Name, d.Address, d.ZipCode, d.City, d.PhoneNo, d.Email, d.Password, d.TotalAmount, SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM deleted d

	IF @operation = 'Insert'
			INSERT INTO Audit_Customer(CustomerID, NewSurname, NewName, NewAdress, NewZipCode, NewCity, NewPhoneNo, NewEmail, NewPassword, NewTotalAmount, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT i.CustomerID, i.Surname, i.Name, i.Address, i.ZipCode, i.City, i.PhoneNo, i.Email, i.Password, i.TotalAmount,SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM inserted i

	IF @operation = 'Update'
			INSERT INTO Audit_Customer(CustomerID, OldSurname, NewSurname, OldName, NewName, OldAdress, NewAdress, OldZipCode, NewZipCode, OldCity, NewCity, OldPhoneNo, NewPhoneNo, OldEmail, NewEmail, OldPassword, NewPassword, OldTotalAmount, NewTotalAmount, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT d.CustomerID, d.Surname, i.Surname, d.Name, i.Name, d.Address, i.Address, d.ZipCode, i.ZipCode, d.City, i.City, d.PhoneNo, i.PhoneNo, d.Email, i.Email, d.Password, i.Password, d.TotalAmount, i.TotalAmount, SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM deleted d, inserted i

END
GO

CREATE TRIGGER AuditCreditCard
ON CreditCard
INSTEAD OF INSERT, UPDATE, DELETE
AS 
	BEGIN
	DECLARE @operation CHAR(6)
		SET @operation = CASE
				WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
					THEN 'Update'
				WHEN EXISTS(SELECT * FROM inserted)
					THEN 'Insert'
				WHEN EXISTS(SELECT * FROM deleted)
					THEN 'Delete'
				ELSE NULL

		END
	IF @operation = 'Delete'
			INSERT INTO Audit_CreditCard(CreditCardID, OldIBANCode, OldCreditCardName, OldCreditCardNumber, OldCreditCardMonth, OldCreditCardYear, OldCCV, OldFK_CustomerID, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT d.CreditCardID, d.IBANCode, d.CreditCardName, d.CreditCardNumber, d.CreditCardMonth, d.CreditCardYear, d.CCV, d.FK_CustomerID, SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM deleted d

	IF @operation = 'Insert'
			INSERT INTO Audit_CreditCard(CreditCardID, NewIBANCode, NewCreditCardName, NewCreditCardNumber, NewCreditCardMonth, NewCreditCardYear, NewCCV, NewFK_CustomerID, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT i.CreditCardID, i.IBANCode, i.CreditCardName, i.CreditCardNumber, i.CreditCardMonth, i.CreditCardYear, i.CCV, i.FK_CustomerID, SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM inserted i

	IF @operation = 'Update'
			INSERT INTO Audit_CreditCard(CreditCardID, OldIBANCode, NewIBANCode, OldCreditCardName, NewCreditCardName, OldCreditCardNumber, NewCreditCardNumber, OldCreditCardMonth, NewCreditCardMonth, OldCreditCardYear, NewCreditCardYear, OldCCV, NewCCV, OldFK_CustomerID, NewFK_CustomerID, HostName, HostID, OperatingSystemUser, OperatingSystemID, updated_at, operation)
			SELECT d.CreditCardID, d.IBANCode, i.IBANCode, d.CreditCardName, i.CreditCardName, d.CreditCardNumber, i.CreditCardNumber, d.CreditCardMonth, i.CreditCardMonth, d.CreditCardYear, i.CreditCardYear, d.CCV, i.CCV, d.FK_CustomerID, i.FK_CustomerID, SESSION_USER, USER_ID(), SYSTEM_USER, SUSER_ID(), GETDATE(), @operation
			FROM deleted d, inserted i

END
GO
