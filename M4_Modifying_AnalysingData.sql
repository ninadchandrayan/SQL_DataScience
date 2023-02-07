--All of the questions in this quiz refer to the open source Chinook Database. 

--1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together.
-----Be sure to make a space in between these two and make it UPPER CASE.

Select
    CustomerId,
    FirstName || " " || LastName AS FullName,
    Address,
    UPPER(City || " " || Country) AS Location
From Customers

+------------+-----------------------+--------------------------------------+----------------------------+
| CustomerId | FullName              | Address                              | Location                   |
+------------+-----------------------+--------------------------------------+----------------------------+
|          1 | Luís Gonçalves        | Av. Brigadeiro Faria Lima, 2170      | SãO JOSé DOS CAMPOS BRAZIL |
|          2 | Leonie Köhler         | Theodor-Heuss-Straße 34              | STUTTGART GERMANY          |
|          3 | François Tremblay     | 1498 rue Bélanger                    | MONTRéAL CANADA            |
|          4 | Bjørn Hansen          | Ullevålsveien 14                     | OSLO NORWAY                |
|          5 | František Wichterlová | Klanova 9/506                        | PRAGUE CZECH REPUBLIC      |
|          6 | Helena Holý           | Rilská 3174/6                        | PRAGUE CZECH REPUBLIC      |
|          7 | Astrid Gruber         | Rotenturmstraße 4, 1010 Innere Stadt | VIENNE AUSTRIA             |
|          8 | Daan Peeters          | Grétrystraat 63                      | BRUSSELS BELGIUM           |
|          9 | Kara Nielsen          | Sønder Boulevard 51                  | COPENHAGEN DENMARK         |
|         10 | Eduardo Martins       | Rua Dr. Falcão Filho, 155            | SãO PAULO BRAZIL           |
|         11 | Alexandre Rocha       | Av. Paulista, 2022                   | SãO PAULO BRAZIL           |
|         12 | Roberto Almeida       | Praça Pio X, 119                     | RIO DE JANEIRO BRAZIL      |
|         13 | Fernanda Ramos        | Qe 7 Bloco G                         | BRASíLIA BRAZIL            |
|         14 | Mark Philips          | 8210 111 ST NW                       | EDMONTON CANADA            |
|         15 | Jennifer Peterson     | 700 W Pender Street                  | VANCOUVER CANADA           |
|         16 | Frank Harris          | 1600 Amphitheatre Parkway            | MOUNTAIN VIEW USA          |
|         17 | Jack Smith            | 1 Microsoft Way                      | REDMOND USA                |
|         18 | Michelle Brooks       | 627 Broadway                         | NEW YORK USA               |
|         19 | Tim Goyer             | 1 Infinite Loop                      | CUPERTINO USA              |
|         20 | Dan Miller            | 541 Del Medio Avenue                 | MOUNTAIN VIEW USA          |
|         21 | Kathy Chase           | 801 W 4th Street                     | RENO USA                   |
|         22 | Heather Leacock       | 120 S Orange Ave                     | ORLANDO USA                |
|         23 | John Gordon           | 69 Salem Street                      | BOSTON USA                 |
|         24 | Frank Ralston         | 162 E Superior Street                | CHICAGO USA                |
|         25 | Victor Stevens        | 319 N. Frances Street                | MADISON USA                |
+------------+-----------------------+--------------------------------------+----------------------------+
(Output limit exceeded, 25 of 59 total rows shown)
------------------------------------------------------------------------------------------------------------------------------------

--2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the 
-----employee’s last name. Make the new field lower case and pull each individual step to show your work.

Select EmployeeId, FirstName, LastName,
       SUBSTR(FirstName,1,4) AS A,
       SUBSTR(LastName,1,2) AS B,
       LOWER(SUBSTR(FirstName,1,4) || SUBSTR(LastName,1,2)) AS EmployeeUserId
From Employees

+------------+-----------+----------+------+----+----------------+
| EmployeeId | FirstName | LastName | A    | B  | EmployeeUserId |
+------------+-----------+----------+------+----+----------------+
|          1 | Andrew    | Adams    | Andr | Ad | andrad         |
|          2 | Nancy     | Edwards  | Nanc | Ed | nanced         |
|          3 | Jane      | Peacock  | Jane | Pe | janepe         |
|          4 | Margaret  | Park     | Marg | Pa | margpa         |
|          5 | Steve     | Johnson  | Stev | Jo | stevjo         |
|          6 | Michael   | Mitchell | Mich | Mi | michmi         |
|          7 | Robert    | King     | Robe | Ki | robeki         |
|          8 | Laura     | Callahan | Laur | Ca | laurca         |
+------------+-----------+----------+------+----+----------------+
-----------------------------------------------------------------------------------------------------------------------------------

--3) Show a list of employees who have worked for the company for 15 or more years using the current date function. 
-----Sort by lastname ascending.

Select EmployeeId, FirstName, LastName, HireDate,
       (STRFTIME('%Y','now') - STRFTIME('%Y', HireDate)) 
	   - (STRFTIME('%d-%m','now') < STRFTIME('%d-%m', HireDate)) AS Tenure
From Employees
Where Tenure >=15
Order by LastName ASC

+------------+-----------+----------+---------------------+--------+
| EmployeeId | FirstName | LastName | HireDate            | Tenure |
+------------+-----------+----------+---------------------+--------+
|          1 | Andrew    | Adams    | 2002-08-14 00:00:00 |     20 |
|          8 | Laura     | Callahan | 2004-03-04 00:00:00 |     19 |
|          2 | Nancy     | Edwards  | 2002-05-01 00:00:00 |     21 |
|          5 | Steve     | Johnson  | 2003-10-17 00:00:00 |     19 |
|          7 | Robert    | King     | 2004-01-02 00:00:00 |     19 |
|          6 | Michael   | Mitchell | 2003-10-17 00:00:00 |     19 |
|          4 | Margaret  | Park     | 2003-05-03 00:00:00 |     20 |
|          3 | Jane      | Peacock  | 2002-04-01 00:00:00 |     21 |
+------------+-----------+----------+---------------------+--------+
-------------------------------------------------------------------------------------------------------------------------

--4) Profiling the Customers table, answer the following question. Are there any columns with null values?

Select * 
From Customers
Where (Company, State, Postalcode, Fax) IS NULL

--Answers: Company, State, PostalCode, Fax have null values
----------------------------------------------------------------------------------------------------------------------------

--5) Find the cities with the most customers and rank in descending order.

Select City, Count(CustomerId) AS TotalCustomers
From Customers
Group by City
Order by Count(*) DESC

+---------------+----------------+
| City          | TotalCustomers |
+---------------+----------------+
| Berlin        |              2 |
| London        |              2 |
| Mountain View |              2 |
| Paris         |              2 |
| Prague        |              2 |
| São Paulo     |              2 |
| Amsterdam     |              1 |
| Bangalore     |              1 |
| Bordeaux      |              1 |
| Boston        |              1 |
| Brasília      |              1 |
| Brussels      |              1 |
| Budapest      |              1 |
| Buenos Aires  |              1 |
| Chicago       |              1 |
| Copenhagen    |              1 |
| Cupertino     |              1 |
| Delhi         |              1 |
| Dijon         |              1 |
| Dublin        |              1 |
| Edinburgh     |              1 |
| Edmonton      |              1 |
| Fort Worth    |              1 |
| Frankfurt     |              1 |
| Halifax       |              1 |
+---------------+----------------+
(Output limit exceeded, 25 of 53 total rows shown)
------------------------------------------------------------------------------------------------------------------

--6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name while 
-----ordering your query in the following order: firstname, lastname, and invoiceID. Select all of the correct 
-----"AstridGruber" entries that are returned in your results below. 

Select cu.CustomerId, cu.FirstName, cu.LastName, inv.InvoiceId,
       cu.FirstName || cu.LastName || InvoiceId AS CustomerInvoiceId
From Customers cu INNER JOIN Invoices inv ON cu.CustomerId = inv.CustomerId 
--Where CustomerInvoiceId like 'AstridGruber%' 
Group by cu.FirstName, cu.LastName, inv.InvoiceId

+------------+-----------+----------+-----------+-------------------+
| CustomerId | FirstName | LastName | InvoiceId | CustomerInvoiceId |
+------------+-----------+----------+-----------+-------------------+
|         32 | Aaron     | Mitchell |        50 | AaronMitchell50   |
|         32 | Aaron     | Mitchell |        61 | AaronMitchell61   |
|         32 | Aaron     | Mitchell |       116 | AaronMitchell116  |
|         32 | Aaron     | Mitchell |       245 | AaronMitchell245  |
|         32 | Aaron     | Mitchell |       268 | AaronMitchell268  |
|         32 | Aaron     | Mitchell |       290 | AaronMitchell290  |
|         32 | Aaron     | Mitchell |       342 | AaronMitchell342  |
|         11 | Alexandre | Rocha    |        57 | AlexandreRocha57  |
|         11 | Alexandre | Rocha    |        68 | AlexandreRocha68  |
|         11 | Alexandre | Rocha    |       123 | AlexandreRocha123 |
|         11 | Alexandre | Rocha    |       252 | AlexandreRocha252 |
|         11 | Alexandre | Rocha    |       275 | AlexandreRocha275 |
|         11 | Alexandre | Rocha    |       297 | AlexandreRocha297 |
|         11 | Alexandre | Rocha    |       349 | AlexandreRocha349 |
|          7 | Astrid    | Gruber   |        78 | AstridGruber78    |
|          7 | Astrid    | Gruber   |        89 | AstridGruber89    |
|          7 | Astrid    | Gruber   |       144 | AstridGruber144   |
|          7 | Astrid    | Gruber   |       273 | AstridGruber273   |
|          7 | Astrid    | Gruber   |       296 | AstridGruber296   |
|          7 | Astrid    | Gruber   |       318 | AstridGruber318   |
|          7 | Astrid    | Gruber   |       370 | AstridGruber370   |
|          4 | Bjørn     | Hansen   |         2 | BjørnHansen2      |
|          4 | Bjørn     | Hansen   |        24 | BjørnHansen24     |
|          4 | Bjørn     | Hansen   |        76 | BjørnHansen76     |
|          4 | Bjørn     | Hansen   |       197 | BjørnHansen197    |
+------------+-----------+----------+-----------+-------------------+
(Output limit exceeded, 25 of 412 total rows shown)
----------------------------------------------------------------------------------------------------------------------



