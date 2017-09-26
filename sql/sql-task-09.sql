-- ZADANIE 9 - usuń produkty, których stan magazynowy wynosi 0
SELECT * FROM Products;
DELETE FROM Products WHERE stock=0;