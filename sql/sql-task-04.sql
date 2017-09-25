-- ZADANIE 4
-- 	- wyświetl wszystkie produkty w formie NAZWA, CENA NETTO, CENA BRUTTO
-- 	- wyświetl listę nazw produktów
-- 	- wyświetl ceny produktów bez powtórzeń

SELECT name AS "NAZWA", price AS "CENA NETTO", ROUND(price*(1+vat/100), 2) AS "CENA BRUTTO" FROM Products;
SELECT name FROM Products;
SELECT DISTINCT price FROM Products;