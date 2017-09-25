-- ZADANIE 5
-- 	- wyświetl produkty, których cena wynosi więcej niż 100 zł
--    i są dostępne aktualnie na magazynie
-- 	- wyświetl produkty, których stawka VAT to 23%
-- 	- wyświetl produkty, które w nazwie mają słowo "klawiatura"
-- 	- wyświetl nazwy produktów, których jest w magazynie od 1 do 30 sztuk

SELECT * FROM Products WHERE price>100 AND stock>0;
SELECT * FROM Products WHERE vat=23;
SELECT * FROM Products WHERE name LIKE '%klawiatura%';
SELECT name FROM Products WHERE stock BETWEEN 1 AND 30;