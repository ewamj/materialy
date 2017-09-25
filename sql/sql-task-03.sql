-- 	ZADANIE 3 - dodaj poniższe pozycje do tabeli Products

-- 	NAME            MANUFACTURER    NETPRICE  VAT    STOCK
-- 	------------    ------------  ----------  ---  -------
-- 	monitor 24''      Dell            999.00   8,  20
-- 	dysk 1TB			    Seagate         350.00  23, 200
-- 	pamięć ram 16GB 	Kingston        140.90   8, 190
-- 	klawiatura PL 	  Dell             90.00  23,  20
-- 	klawiatura EN	    Microsoft        87.00  23,  30
-- 	klawiatura DE 	  Apple            87.00  23,   0
-- 	Mysz bezprzew.		Microsoft        48.35   8, 200
-- 	płyta główna ATX 	Gigabyte        702.00  23,   3
-- 	Nvidia GTX780     Gigabyte        892.00  23,  21

DESCRIBE Products;

ALTER TABLE Products ADD manufacturer VARCHAR(100) AFTER name;
ALTER TABLE Products MODIFY id INT AUTO_INCREMENT;

INSERT INTO Products VALUES
  (null, "monitor 24''", 'Dell', 999.00, 8,  20),
  (null, 'dysk 1TB',			    'Seagate',         350.00,  23, 200),
  (null, 'pamiec ram 16GB', 	'Kingston',        140.90,   8, 190),
  (null, 'klawiatura PL', 	  'Dell',             90.00,  23,  20),
  (null, 'klawiatura EN',	    'Microsoft',        87.00,  23,  30),
  (null, 'klawiatura DE', 	  'Apple',            87.00,  23,   0),
  (null, 'Mysz bezprzew.',		'Microsoft',        48.35,   8, 200),
  (null, 'plyta glowna ATX', 	'Gigabyte',        702.00,  23,   3),
  (null, 'Nvidia GTX780',     'Gigabyte',        892.00,  23,  21);


INSERT INTO Products VALUES
  (null, 'monitor 26\'\'', 'Dell', 999.00, 8,  20);
