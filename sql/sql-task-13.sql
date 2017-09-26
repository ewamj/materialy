-- ZADANIE 13
--   - wyświetl produkty, które nie mają przypisanej żadnej kategorii
--   - wyświetl kategorie, do których nie jest przypisany żaden produkt

select * from Products;
select name from Products where category_id is null;

select c.name from Categories c left join Products p on c.id = p.category_id where p.name is null;