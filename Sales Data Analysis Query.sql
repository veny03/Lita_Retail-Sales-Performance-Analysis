select * from [dbo].['Sales Data$']

select * from [dbo].[Working Sheet]

select * from [dbo].[Calculation]

select * from [dbo].[Pivot File]

-----Total Sales for each product category------

SELECT Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM [dbo].[Working Sheet]
GROUP BY Product

------Number of Sales Transactions in each region----

SELECT Region, COUNT(*) AS SalesTransactions
FROM [dbo].[Working Sheet]
GROUP BY Region

------Highest-selling product by total sales value----

SELECT TOP 1 Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM [dbo].[Working Sheet]
GROUP BY Product
ORDER BY TotalSales DESC

------Total Revenue per Product-----

SELECT Product, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM [dbo].[Working Sheet]
GROUP BY Product

------Monthly sales total for the current year----

SELECT MONTH(OrderDate) AS SaleMonth, SUM(Quantity * UnitPrice) AS MonthlySales
FROM [dbo].[Working Sheet]
WHERE YEAR(OrderDate) = 2024
GROUP BY MONTH(OrderDate)

------Top 5 Customers by total purchase amount------

SELECT TOP 5 [Customer Id], SUM(Quantity * UnitPrice) AS TotalSpent
FROM [dbo].[Working Sheet]
GROUP BY [Customer Id]
ORDER BY TotalSpent DESC

------Percentage of Total Sales contributed by each region-----

SELECT Region, (SUM(Quantity * UnitPrice) / (SELECT SUM(Quantity * UnitPrice) FROM [dbo].[Working Sheet]) * 100) AS SalesPercentage
FROM [dbo].[Working Sheet]
GROUP BY Region

------Product wwith no sales in the last quarter-----

SELECT Product
FROM [dbo].[Working Sheet]
WHERE OrderDate BETWEEN '2024-06-01' AND '2024-09-30'
GROUP BY Product
HAVING SUM(Quantity) = 0
