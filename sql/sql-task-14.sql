-- ZADANIE 14
--   - wyświetl nazwy produktów wraz z ich cenami brutto (netto + vat)
--   - wyświetl nazwy produktów oraz przy każdej z nich wartość netto
--     towaru w magazynie (liczba sztuk * cena netto)

select name, round(price*(1+vat/100), 1) as 'cenna brutto' from Products;

select name, round(price*stock,2) from Products;