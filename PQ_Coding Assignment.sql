--All of the questions in this quiz pull from the open source Chinook Database.

--1) How many albums does the artist Led Zeppelin have? 

Select COUNT(AlbumId) AS Total_Albums
From Albums 
Where ArtistId = (Select ArtistId
                From Artists
                Where Name = 'Led Zeppelin')
+--------------+
| Total_Albums |
+--------------+
|           14 |
+--------------+
----------------------------------------------------------------------------------------

--2) Create a list of album titles and the unit prices for the artist "Audioslave".

Select al.Title, tr.UnitPrice, ar.Name
From albums al INNER JOIN tracks tr ON al.AlbumId = tr.AlbumId
               INNER JOIN artists ar ON ar.ArtistId = al.ArtistId
Where ar.Name = 'Audioslave'
+--------------+-----------+------------+
| Title        | UnitPrice | Name       |
+--------------+-----------+------------+
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Audioslave   |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
| Out Of Exile |      0.99 | Audioslave |
+--------------+-----------+------------+
(Output limit exceeded, 25 of 40 total rows shown)
----------------------------------------------------------------------------------------------------------------

--3)Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?  

Select cu.CustomerId, cu.FirstName, cu.LastName, inv.InvoiceId
From Customers cu INNER JOIN Invoices inv ON cu.CustomerId = inv.CustomerId
Where inv.InvoiceId IS NULL

+------------+-----------+----------+-----------+
| CustomerId | FirstName | LastName | InvoiceId |
+------------+-----------+----------+-----------+
+------------+-----------+----------+-----------+
(Zero rows) discovered
---------------------------------------------------------------------------------------------------------------------

--4) Find the total price for each album. What is the total price for the album “Big Ones”?

Select al.Title, SUM(tr.UnitPrice) as TotalPrice
From tracks tr INNER JOIN albums al ON al.AlbumId = tr.AlbumId
Where al.Title = 'Big Ones'

+----------+------------+
| Title    | TotalPrice |
+----------+------------+
| Big Ones |      14.85 |
+----------+------------+
----------------------------------------------------------------------------------------------------------------------

--5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?

Select COUNT(*) as TotalRecords
From Invoices CROSS JOIN Invoice_items

+--------------+
| TotalRecords |
+--------------+
|       922880 |
+--------------+
----------------------------------------------------------------------------------------------------------------------
