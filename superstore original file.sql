SELECT * FROM orders; # DISPLAY ORDER TABLE
SELECT * FROM people; # DISPLAY PEOPLE TABLE
SELECT * FROM returns; # DISPLAY RETURNS TABLE

# CITY WISE SALES AND PROFIT
SELECT City,Sales, Profit FROM orders ORDER BY City;
SELECT City ,SUM(Sales) AS total_sales,SUM(Profit) AS total_profit FROM orders GROUP BY City; 

# SEGMENT WISE MAXIMUM SALES,DISCOUNTS,PROFIT
SELECT Segment,MAX(Sales) AS Maximum_Sales, MAX(Discount) AS Maximum_Discount ,MAX(Profit) AS Maximum_Profit FROM orders GROUP BY Segment;

# CITY WISE TOP 3 SALES
SELECT City, Sales_Rank, Sales
FROM ( SELECT City, RANK() OVER (PARTITION BY City ORDER BY Sales DESC) AS Sales_Rank,Sales FROM orders ) ranked_orders 
WHERE Sales_Rank <= 3;

# CREATE TABLES USING JOIN BASED ON KEY ORDER,PERSON,RETURN-ORDERID,PERSON
CREATE TABLE Combinedata1 AS
SELECT o.`Order ID` AS OrderID_o,
    o.Region AS OrderRegion,
    p.Person,o.City,o.Sales,o.Profit,o.Discount,O.Segment
    FROM orders o LEFT JOIN  returns r ON o.`Order ID` =r.`Order ID` 
LEFT JOIN people p ON o.Region = p.Region;

SELECT * FROM Combinedata1; # DISPLAY COMBINEDATA1 TABLE
#  CITY WISE SALES AND PROFIT FOR COMBINEDATA1 TABLE
SELECT City ,SUM(Sales) AS total_sales,SUM(Profit) AS total_profit FROM Combinedata1 GROUP BY City;

# SEGMENT WISE MAXIMUM SALES,DISCOUNTS,PROFIT FOR COMBINEDATA1 TABLE
SELECT Segment,MAX(Sales) AS Maximum_Sales, MAX(Discount) AS Maximum_Discount ,MAX(Profit) AS Maximum_Profit FROM Combinedata1 GROUP BY Segment;

# CITY WISE TOP 3 SALES  FOR COMBINEDATA1 TABLE
SELECT City, Sales_Rank, Sales
FROM ( SELECT City, RANK() OVER (PARTITION BY City ORDER BY Sales DESC) AS Sales_Rank,Sales FROM  Combinedata1) ranked_orders 
WHERE Sales_Rank <= 3;
# VIEW
CREATE VIEW Super_Store_view AS
SELECT o.`Order ID`
FROM orders o
JOIN returns r ON o. `Order ID` = r. `Order ID`;

# STORE PROCEDURE FOR ALL TASK
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
SELECT * FROM orders; # DISPLAY ORDER TABLE
SELECT * FROM people; # DISPLAY PEOPLE TABLE
SELECT * FROM returns; # DISPLAY RETURNS TABLE

# CITY WISE SALES AND PROFIT
SELECT City,Sales, Profit FROM orders ORDER BY City;
SELECT City ,SUM(Sales) AS total_sales,SUM(Profit) AS total_profit FROM orders GROUP BY City; 

# SEGMENT WISE MAXIMUM SALES,DISCOUNTS,PROFIT
SELECT Segment,MAX(Sales) AS Maximum_Sales, MAX(Discount) AS Maximum_Discount ,MAX(Profit) AS Maximum_Profit FROM orders GROUP BY Segment;

# CITY WISE TOP 3 SALES
SELECT City, Sales_Rank, Sales
FROM ( SELECT City, RANK() OVER (PARTITION BY City ORDER BY Sales DESC) AS Sales_Rank,Sales FROM orders ) ranked_orders 
WHERE Sales_Rank <= 3;

# CREATE TABLES USING JOIN BASED ON KEY ORDER,PERSON,RETURN-ORDERID,PERSON
CREATE TABLE Combinedata1 AS
SELECT o.`Order ID` AS OrderID_o,
    o.Region AS OrderRegion,
    p.Person,o.City,o.Sales,o.Profit,o.Discount,O.Segment
    FROM orders o LEFT JOIN  returns r ON o.`Order ID` =r.`Order ID` 
LEFT JOIN people p ON o.Region = p.Region;

SELECT * FROM Combinedata1; # DISPLAY COMBINEDATA1 TABLE
#  CITY WISE SALES AND PROFIT FOR COMBINEDATA1 TABLE
SELECT City ,SUM(Sales) AS total_sales,SUM(Profit) AS total_profit FROM Combinedata1 GROUP BY City;

# SEGMENT WISE MAXIMUM SALES,DISCOUNTS,PROFIT FOR COMBINEDATA1 TABLE
SELECT Segment,MAX(Sales) AS Maximum_Sales, MAX(Discount) AS Maximum_Discount ,MAX(Profit) AS Maximum_Profit FROM Combinedata1 GROUP BY Segment;

# CITY WISE TOP 3 SALES  FOR COMBINEDATA1 TABLE
SELECT City, Sales_Rank, Sales
FROM ( SELECT City, RANK() OVER (PARTITION BY City ORDER BY Sales DESC) AS Sales_Rank,Sales FROM  Combinedata1) ranked_orders 
WHERE Sales_Rank <= 3;
# VIEW
CREATE VIEW Super_Store_view AS
SELECT o.`Order ID`
FROM orders o
JOIN returns r ON o. `Order ID` = r. `Order ID`;

# STORE PROCEDURE FOR ALL TASK


END$$
DELIMITER ;

CALL `super_store_data`.`new_procedure`();

