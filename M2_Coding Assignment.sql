--All of the questions in this quiz refer to the open source Chinook Database.

--1) Find all the tracks that have a length of 5,000,000 milliseconds or more.
 
Select *
From Tracks
Where Milliseconds >= 5000000

--Two tracks returned after running the query.
-------------------------------------------------------------------------------------------

--2) Find all the invoices whose total is between $5 and $15 dollars.

Select *
From Invoices
Where Total Between 5 AND 15

--Total Number of Records = 168
-----------------------------------------------------------------------------------------------

--3) Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

Select *
From Customers
Where State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')
--------------------------------------------------------------------------------------------------

--4) Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

Select *
From Invoices
Where (CustomerId IN ('56', '58')) AND (Total BETWEEN 1 AND 5)
----------------------------------------------------------------------------------------------------

--5) Find all the tracks whose name starts with 'All'.

Select *
From Tracks
Where Name like 'All%'

------------------------------------------------------------------------------------------------------

--6) Find all the customer emails that start with "J" and are from gmail.com.

Select *
From Customers
Where email like 'J%gmail.com'
-------------------------------------------------------------------------------------------------------

--7) Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

Select *
From Invoices
Where BillingCity IN ('Brasilia', 'Edmonton', 'Vancouver')
Order by InvoiceId DESC
---------------------------------------------------------------------------------------------------------

--8) Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

Select CustomerId, 
COUNT(InvoiceId) as Number_of_Orders
From Invoices
Group by CustomerId
Order by Number_of_Orders DESC
----------------------------------------------------------------------------------------------------------------

--9) Find the albums with 12 or more tracks.

Select AlbumId, Count(*) AS No_of_Tracks
From Tracks
Group by AlbumId
Having Count(*) >= 12
----------------------------------------------------------------------------------------------------------------
