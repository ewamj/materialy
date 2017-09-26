-- ZADANIE 7
-- 	- wyświetl zestawienie sumarycznych kwot netto dla każdej stawki VAT w
--    formie RAZEM NETTO, STAWKA VAT
-- 	- ogranicz zestawienie sumaryczne tylko do tych produktów,
--    których dostępność w magazynie jest > 100
-- 	- wyświetl minimalną, maksymalną oraz średnią cenę produktów w sklepie
-- 	- wyświetl listę producentów wraz z ich liczbą produktów w ofercie sklepu

DESCRIBE Products;
SELECT * FROM Products;

SELECT vat AS "STAWKA VAT", sum(price) AS "RAZEM NETTO" FROM Products GROUP BY vat;
SELECT vat AS "STAWKA VAT", sum(price) AS "RAZEM NETTO" FROM Products WHERE stock>100 GROUP BY vat;

SELECT manufacturer, MIN(price), MAX(price), ROUND(AVG(price), 2) FROM Products GROUP BY manufacturer, price;

SELECT manufacturer, COUNT(price) FROM Products GROUP BY manufacturer;
SELECT manufacturer, COUNT(DISTINCT price) FROM Products GROUP BY manufacturer;