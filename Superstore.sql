select * from superstore s limit 5

# 1. What are total sales and total profits of each year?
SELECT DATE_FORMAT(`Order Date` , '%Y-01-01') AS truncated_year
from superstore s  ;
# --Used to truncate orderdate to the beginning of the year
select DATE_FORMAT(`Order Date` , '%Y-01-01') AS truncated_year, 
round( Sum(Sales),2) as total_sales, 
round(sum(Profit),2) as total_profit 
from superstore s 
GROUP BY DATE_FORMAT(`Order Date` , '%Y-01-01')

#2.What are the total profits and total sales per quarter? 
# step 1 Convert the months 123, 456, 789,101112 to quarters 1,2,3,4 using the case...end function
SELECT
    YEAR(`Order Date`) AS Year,
    CASE 
        WHEN MONTH(`Order Date`) IN (1, 2, 3) THEN 'Q1'
        WHEN MONTH(`Order Date`) IN (4, 5, 6) THEN 'Q2'
        WHEN MONTH(`Order Date`) IN (7, 8, 9) THEN 'Q3'
        WHEN MONTH(`Order Date`) IN (10, 11, 12) THEN 'Q4'
        ELSE 'Unknown'
    END AS quarter,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit 
FROM
    superstore s
GROUP BY
    Year,
    quarter;
   
   
#3. What region generates the highest sales and profits ?
   select Region,
     ROUND(SUM(Sales), 2) AS total_sales,
     ROUND(SUM(Profit), 2) AS total_profit from superstore s 
   group by region 
 order by total_sales, total_profit desc
 
 # Step 2 regions profit margins = tỷ suất lợi nhuận SUM(profit) / SUM(sales) * 100 further analysis 
   select Region, round((SUM(profit) / SUM(sales) * 100),2) as profit_margins  from superstore s 
   group by region 
   order by profit_margins desc
# => Profit margins are a measure of a company’s profitability and are expressed as the percentage of revenue that the company keeps as profit

   
# 4. What state and city brings in the highest sales and profits ?
  #State
SELECT State, 
  round(SUM(Sales),2) as Total_Sales, 
  Round(SUM(Profit),2) as Total_Profits, 
  ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_mar
FROM superstore
GROUP BY State
ORDER BY Total_Profits DESC
LIMIT 10;
 
#City
SELECT City, 
round(SUM(Sales),2)  as Total_Sales, 
Round(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_marg
FROM superstore
GROUP BY City
ORDER BY Total_Profits DESC
LIMIT 10;


#5. The relationship between discount and sales and the total discount per category
#First, let’s observe the correlation between discount and average sales to understand how impactful one is to the other.
 SELECT Discount, AVG(Sales) AS Avg_Sales
FROM superstore
GROUP BY Discount
ORDER BY Discount;

#Let’s observe the total discount per product category:
select Category , sum(Discount) from superstore s 
group by Category 
ORDER BY  sum(Discount) desc;
# => So Office supplies are the most discounted items 
# Step 2  see exactly what type of products are the most discounted.
select Category , `Sub-Category`,  sum(Discount) as Sum_Discount from superstore s 
group by Category, `Sub-Category`
ORDER BY  sum(Discount) desc;
# => It Binders is product he most discounted.


#6. What category generates the highest sales and profits in each region and state ?
SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit, ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

#region the highest sales and profits
SELECT region, category, 
round(SUM(sales),2) AS total_sales, 
round(SUM(profit),2) AS total_profit, 
ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY region, category
ORDER BY total_profit DESC;

#State the highest sales and profits
SELECT State  , category, 
round(SUM(sales),2) AS total_sales, 
round(SUM(profit),2) AS total_profit, 
ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY State , category
ORDER BY total_profit DESC;

#7. What subcategory generates the highest sales and profits in each region and state ?
SELECT `Sub-Category` , 
SUM(sales) AS total_sales, 
SUM(profit) AS total_profit, 
ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;

#region the highest sales and profits
SELECT region, `Sub-Category` , 
SUM(sales) AS total_sales, 
SUM(profit) AS total_profit,
ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY region, `Sub-Category`
ORDER BY total_profit DESC

#State the highest sales and profits
SELECT State , `Sub-Category` , 
SUM(sales) AS total_sales, 
SUM(profit) AS total_profit,
ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY State , `Sub-Category`
ORDER BY total_profit desc

#8. What are the names of the products that are the most and least profitable to us?
SELECT `Product Name` , SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit DESC;
#=> The most Canon imageclass 2200 advanced copier

SELECT `Product Name` , SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit ASC;
#-> The least Cubify CubeX 3d Printer


#9. What segment makes the most of our profits and sales ?
SELECT Segment  , SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY total_profit desc ;
#-> the most consumer

SELECT Segment  , SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY Segment
ORDER BY total_profit ASC;
#-> The least Home Office

#10. How many customers do we have (unique customer IDs) in total and how much per region and state?
SELECT
    COUNT(DISTINCT `Customer ID`) AS Total_Customers,
    Region,
    State
FROM
    superstore
GROUP BY
    Region,
    State;
  
##11. Customer rewards program
  #step 1 See which customer id manages the most revenue
    SELECT `Customer ID`  , SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM superstore
GROUP BY `Customer ID`
ORDER BY total_profit desc limit 15

#12. Average shipping time per class and in total
#Finally, the average shipping time regardless of the shipping mode that is chosen is found with the following function:
   SELECT ROUND(AVG(`Ship Date`  - `Order Date`),1) AS avg_shipping_time
FROM superstore

#The shipping time in each shipping mode is:
SELECT `Ship Mode` ,ROUND(AVG(`Ship Date`  - `Order Date`),1) AS avg_shipping_time
FROM superstore
GROUP BY `Ship Mode` 
ORDER BY avg_shipping_time