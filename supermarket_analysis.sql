-- Step 1: Show all sales
SELECT *
FROM supermarket_sales;


-- Step 2: Total revenue
SELECT SUM(Total_Sales_NOK) AS Total_Revenue
FROM supermarket_sales;


-- Step 3: Revenue by product
SELECT
    Product,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Product
ORDER BY Revenue DESC;


-- Step 4: Revenue by category
SELECT
    Category,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Category
ORDER BY Revenue DESC;


-- Step 5: Revenue by payment method
SELECT
    Payment,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Payment
ORDER BY Revenue DESC;

-- Step 6: Revenue by month

SELECT
    strftime('%Y-%m', Date) AS Month,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Month
ORDER BY Month;

-- Step 7: Products by quantity sold

SELECT
    Product,
    SUM(Quantity) AS Total_Quantity
FROM supermarket_sales
GROUP BY Product
ORDER BY Total_Quantity DESC;

-- Step 8: Average sale value

SELECT
    AVG(Total_Sales_NOK) AS Average_Sale
FROM supermarket_sales;


-- Step 9: Highest single sale

SELECT
    Product,
    Date,
    Quantity,
    Total_Sales_NOK
FROM supermarket_sales
ORDER BY Total_Sales_NOK DESC
LIMIT 1;


-- Step 10: Sales above 200 NOK

SELECT
    Date,
    Product,
    Quantity,
    Total_Sales_NOK
FROM supermarket_sales
WHERE Total_Sales_NOK > 200
ORDER BY Total_Sales_NOK DESC;


-- Step 11: Products with revenue above 1000 NOK

SELECT
    Product,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Product
HAVING SUM(Total_Sales_NOK) > 1000
ORDER BY Revenue DESC;


-- Step 12: Number of transactions

SELECT
    COUNT(*) AS Number_of_Transactions
FROM supermarket_sales;


-- Step 13: Category performance

SELECT
    Category,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Category
ORDER BY Revenue DESC;

-- Step 14: Average sale value by product

SELECT
    Product,
    COUNT(*) AS Number_of_Sales,
    AVG(Total_Sales_NOK) AS Average_Sale
FROM supermarket_sales
GROUP BY Product
ORDER BY Average_Sale DESC;


-- Step 15: Product sales performance

SELECT
    Product,
    SUM(Quantity) AS Units_Sold,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Product
ORDER BY Revenue DESC;


-- Step 16: Monthly performance

SELECT
    strftime('%Y-%m', Date) AS Month,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Month
ORDER BY Month;


-- Step 17: Highest revenue month

SELECT
    strftime('%Y-%m', Date) AS Month,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Month
ORDER BY Revenue DESC
LIMIT 1;


-- Step 18: Classify sales

SELECT
    Product,
    Total_Sales_NOK,
    CASE
        WHEN Total_Sales_NOK >= 200 THEN 'High'
        WHEN Total_Sales_NOK >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Level
FROM supermarket_sales
ORDER BY Total_Sales_NOK DESC;


-- Step 19: Count sales by sales level

SELECT
    CASE
        WHEN Total_Sales_NOK >= 200 THEN 'High'
        WHEN Total_Sales_NOK >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Level,
    COUNT(*) AS Number_of_Sales
FROM supermarket_sales
GROUP BY Sales_Level
ORDER BY Number_of_Sales DESC;


-- Step 20: Revenue by sales level

SELECT
    CASE
        WHEN Total_Sales_NOK >= 200 THEN 'High'
        WHEN Total_Sales_NOK >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS Sales_Level,
    COUNT(*) AS Number_of_Sales,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Sales_Level
ORDER BY Revenue DESC;


-- Step 21: Average unit price by product

SELECT
    Product,
    AVG(Unit_Price_NOK) AS Average_Unit_Price
FROM supermarket_sales
GROUP BY Product
ORDER BY Average_Unit_Price DESC;


-- Step 22: Highest quantity in a single sale

SELECT
    Product,
    Date,
    Quantity,
    Unit_Price_NOK,
    Total_Sales_NOK
FROM supermarket_sales
ORDER BY Quantity DESC
LIMIT 1;


-- Step 23: Lowest revenue product

SELECT
    Product,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Product
ORDER BY Revenue ASC
LIMIT 1;


-- Step 24: Best-selling product by quantity

SELECT
    Product,
    SUM(Quantity) AS Total_Quantity
FROM supermarket_sales
GROUP BY Product
ORDER BY Total_Quantity DESC
LIMIT 1;


-- Step 25: Products with revenue above average

SELECT
    Product,
    SUM(Total_Sales_NOK) AS Revenue
FROM supermarket_sales
GROUP BY Product
HAVING SUM(Total_Sales_NOK) >
       (
           SELECT AVG(Product_Revenue)
           FROM (
               SELECT SUM(Total_Sales_NOK) AS Product_Revenue
               FROM supermarket_sales
               GROUP BY Product
           )
       )
ORDER BY Revenue DESC;



-- Step 26: Product revenue percentage

SELECT
    Product,
    SUM(Total_Sales_NOK) AS Revenue,
    ROUND(
        SUM(Total_Sales_NOK) * 100.0 /
        (SELECT SUM(Total_Sales_NOK)
         FROM supermarket_sales),
        2
    ) AS Revenue_Percentage
FROM supermarket_sales
GROUP BY Product
ORDER BY Revenue DESC;



-- Step 27: Average transaction value by category

SELECT
    Category,
    COUNT(*) AS Number_of_Transactions,
    SUM(Total_Sales_NOK) AS Total_Revenue,
    ROUND(AVG(Total_Sales_NOK), 2) AS Average_Transaction_Value
FROM supermarket_sales
GROUP BY Category
ORDER BY Average_Transaction_Value DESC;