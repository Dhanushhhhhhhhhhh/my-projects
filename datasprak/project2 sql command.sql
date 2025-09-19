use projectdf;
select * from df;
# 1total order by country
SELECT Country, COUNT(DISTINCT `Order Number`) AS Total_Orders
FROM df
GROUP BY Country
ORDER BY Total_Orders DESC;

#2 Top 10 Products by Quantity Sold
SELECT `Product Name`, SUM(Quantity) AS Total_Quantity
FROM df
GROUP BY `Product Name`
ORDER BY Total_Quantity DESC
LIMIT 10;

#🟢 3. Sales by Brand and Category
SELECT Brand, Category, SUM(Quantity) AS Total_Quantity
FROM df
GROUP BY Brand, Category
ORDER BY Total_Quantity DESC;

#.4  Monthly Order Trend
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    COUNT(DISTINCT `Order Number`) AS Orders
FROM df
GROUP BY Month
ORDER BY Month;

# 5Average Unit Price by Category
SELECT 
    Category, 
    AVG(CAST(REPLACE(`Unit Price USD`, '$', '') AS DECIMAL(10,2))) AS Avg_Unit_Price
FROM df
GROUP BY Category
ORDER BY Avg_Unit_Price DESC;


# 6Customer Age Group Distribution
SELECT AgeGroup, COUNT(DISTINCT CustomerKey) AS Customer_Count
FROM df
GROUP BY AgeGroup
ORDER BY Customer_Count DESC;

#7 Total Sales per Store
SELECT StoreKey AS StoreKey, SUM(Quantity) AS Total_Units
FROM df
GROUP BY StoreKey
ORDER BY Total_Units DESC;

# 8 Revenue by Product
SELECT 
    `Product Name`,
    SUM(CAST(REPLACE(`Unit Price USD`, '$', '') AS DECIMAL(10,2)) * Quantity) AS Total_Revenue
FROM df
GROUP BY `Product Name`
HAVING Total_Revenue > 0
ORDER BY Total_Revenue DESC
LIMIT 5;

# 9 Average Delivery Time (in days)
SELECT 
    AVG(DATEDIFF(`Delivery Date`, `Order Date`)) AS Avg_Delivery_Days
FROM df;

# 10 Exchange Rate Trend by Currency
SELECT 
    Currency,
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    AVG(CAST(Exchange AS DECIMAL(10,4))) AS Avg_Exchange_Rate
FROM df
GROUP BY Currency, Month
ORDER BY Currency, Month;



