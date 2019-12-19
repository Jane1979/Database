use Product
go

INSERT INTO Product ([Name], [Url], [Description] , Unitprice, Stock) VALUES ('Squishies', 'Squishies.jpg', 'Get lost in a cheerful world full of adventures! Squishies™ is a single player, puzzle platform experience, built exclusively for PlayStation®VR. Solve puzzles and save Squishies or be creative and build your own levels then share them with the community. Roll the Squishies by pulling and pushing them with your Alien Fish Friends (PlayStation®Move Motion Controllers) across 100 levels in five different worlds. Use alien technology and your environment to collect crystals and ensure them a safe route home.', 249, 30)
INSERT INTO Rating ([Value], Comment, FK_CustomerID, FK_ProductID) VALUES ( 3,'', 7, IDENT_CURRENT('Product'))
INSERT INTO Product ([Name], [Url], [Description] , Unitprice, Stock) VALUES ('Lego Marvel Superheroes', 'LegoSuperHeroes.jpg', 'LEGO Marvel Super Heroes complements the LEGO Marvel Super Heroes construction toy collection, which brings the characters, vehicles and action of Marvel’s renowned universe to the world of LEGO build-and-play adventure. There are currently eight iconic scenes from the X-Men, Iron Man and Spider-Man franchises available and more construction sets tied to the new Iron Man 3 feature film will launch later this spring.', 149, 35)



Declare @ProductID int
SELECT @ProductID = [ProductID] FROM Product WHERE Product.[Name] = 'Lego Marvel Superheroes'
DELETE FROM Rating WHERE FK_ProductID = @ProductID
	DELETE FROM Product WHERE ProductID = @ProductID

UPDATE Product SET [Name] = 'Squishies 2' WHERE [Url] = 'Squishies.jpg'
UPDATE Rating SET [Value] = 5 WHERE FK_CustomerID = 9 AND FK_ProductID = 19


SELECT * FROM v_Product
go