--All of the questions in this quiz refer to the open source Chinook Database.

--1) Using a subquery, find the names of all the tracks for the album "Californication". What is the title of the 8th track?

Select TrackId, Name, AlbumId
From Tracks
Where AlbumId = (Select AlbumId
                From Albums
                Where Title = 'Californication')
+---------+-------------------+---------+
| TrackId | Name              | AlbumId |
+---------+-------------------+---------+
|    2391 | Around The World  |     195 |
|    2392 | Parallel Universe |     195 |
|    2393 | Scar Tissue       |     195 |
|    2394 | Otherside         |     195 |
|    2395 | Get On Top        |     195 |
|    2396 | Californication   |     195 |
|    2397 | Easily            |     195 |
|    2398 | Porcelain         |     195 |
|    2399 | Emit Remmus       |     195 |
|    2400 | I Like Dirt       |     195 |
+---------+-------------------+---------+
(Output limit exceeded, 10 of 15 total rows shown)
-------------------------------------------------------------------------------------------------------------

--2) Find the total number of invoices for each customer along with the customer's full name, city and email. what is the email address of the 5th person, František Wichterlová?

Select cu.CustomerId, cu.FirstName, cu.LastName, cu.City, cu.email, inv.InvoiceId
From Customers cu INNER JOIN Invoices inv ON cu.CustomerId = inv.CustomerId
Group by cu.CustomerId

+------------+-----------+-------------+---------------------+--------------------------+-----------+
| CustomerId | FirstName | LastName    | City                | Email                    | InvoiceId |
+------------+-----------+-------------+---------------------+--------------------------+-----------+
|          1 | Luís      | Gonçalves   | São José dos Campos | luisg@embraer.com.br     |       382 |
|          2 | Leonie    | Köhler      | Stuttgart           | leonekohler@surfeu.de    |       293 |
|          3 | François  | Tremblay    | Montréal            | ftremblay@gmail.com      |       391 |
|          4 | Bjørn     | Hansen      | Oslo                | bjorn.hansen@yahoo.no    |       392 |
|          5 | František | Wichterlová | Prague              | frantisekw@jetbrains.com |       361 |
|          6 | Helena    | Holý        | Prague              | hholy@gmail.com          |       404 |
|          7 | Astrid    | Gruber      | Vienne              | astrid.gruber@apple.at   |       370 |
|          8 | Daan      | Peeters     | Brussels            | daan_peeters@apple.be    |       394 |
|          9 | Kara      | Nielsen     | Copenhagen          | kara.nielsen@jubii.dk    |       340 |
|         10 | Eduardo   | Martins     | São Paulo           | eduardo@woodstock.com.br |       383 |
+------------+-----------+-------------+---------------------+--------------------------+-----------+
(Output limit exceeded, 10 of 59 total rows shown)
---------------------------------------------------------------------------------------------------------------------------------------

--3)Retrieve the track name, album, artistID, and trackID for all the albums. What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? 

Select tr.TrackId, tr.Name, al.Title, ar.ArtistId
From Tracks tr INNER JOIN Albums al ON tr.AlbumId = al.AlbumId
                INNER JOIN Artists ar ON ar.ArtistId = al.ArtistId

+---------+-----------------------------------------+---------------------------------------+----------+
| TrackId | Name                                    | Title                                 | ArtistId |
+---------+-----------------------------------------+---------------------------------------+----------+
|       1 | For Those About To Rock (We Salute You) | For Those About To Rock We Salute You |        1 |
|       6 | Put The Finger On You                   | For Those About To Rock We Salute You |        1 |
|       7 | Lets Get It Up                         | For Those About To Rock We Salute You |        1 |
|       8 | Inject The Venom                        | For Those About To Rock We Salute You |        1 |
|       9 | Snowballed                              | For Those About To Rock We Salute You |        1 |
|      10 | Evil Walks                              | For Those About To Rock We Salute You |        1 |
|      11 | C.O.D.                                  | For Those About To Rock We Salute You |        1 |
|      12 | Breaking The Rules                      | For Those About To Rock We Salute You |        1 |
|      13 | Night Of The Long Knives                | For Those About To Rock We Salute You |        1 |
|      14 | Spellbound                              | For Those About To Rock We Salute You |        1 |
+---------+-----------------------------------------+---------------------------------------+----------+
(Output limit exceeded, 10 of 3503 total rows shown)
--------------------------------------------------------------------------------------------------------------------------------------

--4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her. who are the reports for the manager named Mitchell (select all that apply)?

Select mgr.LastName Manager, emp.LastName Employee
From Employees mgr JOIN Employees emp ON mgr.EmployeeId = emp.ReportsTo

+----------+----------+
| Manager  | Employee |
+----------+----------+
| Adams    | Edwards  |
| Adams    | Mitchell |
| Edwards  | Peacock  |
| Edwards  | Park     |
| Edwards  | Johnson  |
| Mitchell | King     |
| Mitchell | Callahan |
+----------+----------+
-------------------------------------------------------------------------------------------------------------------------------------------

--5) Find the name and ID of the artists who do not have albums. two of the records returned have the same last name.

+----------+----------------------------+-------+
| ArtistId | Name                       | Title |
+----------+----------------------------+-------+
|       25 | Milton Nascimento & Bebeto |  None |
|       26 | Azymuth                    |  None |
|       28 | João Gilberto              |  None |
|       29 | Bebel Gilberto             |  None |
|       30 | Jorge Vercilo              |  None |
|       31 | Baby Consuelo              |  None |
|       32 | Ney Matogrosso             |  None |
|       33 | Luiz Melodia               |  None |
|       34 | Nando Reis                 |  None |
|       35 | Pedro Luís & A Parede      |  None |
+----------+----------------------------+-------+
(Output limit exceeded, 10 of 71 total rows shown)
------------------------------------------------------------------------------------------------------------------------------
--6)Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order. determine what is the last name of the 6th record?

Select FirstName, LastName
From Employees
UNION
Select FirstName, LastName
From Customers
Order by LastName DESC

+-----------+--------------+
| FirstName | LastName     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)
--------------------------------------------------------------------------------------------------------------------------------
--7) See if there are any customers who have a different city listed in their billing city versus their customer city.

Select cu.CustomerId, cu.FirstName, cu.LastName, cu.City, inv.BillingCity
From Customers cu JOIN Invoices inv ON cu.CustomerId = inv.CustomerId
Where inv.BillingCity <> cu.City

+------------+-----------+----------+------+-------------+
| CustomerId | FirstName | LastName | City | BillingCity |
+------------+-----------+----------+------+-------------+
+------------+-----------+----------+------+-------------+
(Zero rows) detected
---------------------------------------------------------------------------------------------------------------------------------






