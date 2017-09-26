DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
  id INT UNSIGNED PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  price DECIMAL(7,2) DEFAULT '10.00'
);

ALTER TABLE Products ADD vat TINYINT UNSIGNED NOT NULL DEFAULT '23';
ALTER TABLE Products ADD stock SMALLINT UNSIGNED NOT NULL DEFAULT '0';

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


