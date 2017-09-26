-- ZADANIE 8
-- 	- zmień stan magazynowy dwóch produktów na 1000 sztuk (przyszła dostawa)
-- 	- zmień stan magazynowy dwóch innych produktów, bo właśnie sprzedało się 5 sztuk każdego z nich
-- 	- podnieś wszystkie ceny w sklepie o 10%

SELECT * FROM Products;
UPDATE Products SET stock=1000 WHERE id IN (2,3);
UPDATE Products SET stock=stock-5 WHERE id BETWEEN 4 AND 5;
UPDATE Products SET price=1.1*price;