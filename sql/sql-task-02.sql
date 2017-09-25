-- ZADANIE 2 - do Products dodaj stawkę VAT oraz liczbę sztuk w magazynie

DESCRIBE Products;

ALTER TABLE Products ADD vat TINYINT UNSIGNED NOT NULL DEFAULT '23';
ALTER TABLE Products ADD stock SMALLINT UNSIGNED NOT NULL DEFAULT '0';

ALTER TABLE Products MODIFY stock MEDIUMINT;

