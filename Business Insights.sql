SELECT TOP 10 
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSales
FROM 
    Sales.SalesOrderDetail sod
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
GROUP BY 
    p.Name
ORDER BY 
    TotalSales DESC;

SELECT 
    FORMAT(soh.OrderDate, 'yyyy-MM') AS OrderMonth,
    SUM(soh.TotalDue) AS MonthlySales
FROM 
    Sales.SalesOrderHeader soh
GROUP BY 
    FORMAT(soh.OrderDate, 'yyyy-MM')
ORDER BY 
    OrderMonth;


SELECT TOP 5 
    soh.CustomerID,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpent
FROM 
    Sales.SalesOrderHeader soh
GROUP BY 
    soh.CustomerID
ORDER BY 
    TotalSpent DESC;


SELECT 
    st.Name AS Territory,
    COUNT(soh.SalesOrderID) AS NumberOfOrders,
    AVG(soh.TotalDue) AS AverageOrderValue
FROM 
    Sales.SalesOrderHeader soh
JOIN 
    Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY 
    st.Name
ORDER BY 
    AverageOrderValue DESC;


SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.UnitPriceDiscount * sod.OrderQty) AS TotalDiscountGiven
FROM 
    Sales.SalesOrderDetail sod
JOIN 
    Production.Product p ON sod.ProductID = p.ProductID
GROUP BY 
    p.Name
ORDER BY 
    TotalDiscountGiven DESC;

