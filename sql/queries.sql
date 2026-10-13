-- name: top_products
--Query 1: Selects top-10 products by total revenue
--Used flags: IsServiceCode

SELECT Description, SUM(Revenue) as total_revenue
FROM sales
WHERE IsServiceCode = 0
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- name: month_revenue
--Query 2: Compiles average revenue for period of month and 3 months
--Used flags: None

WITH monthly_orders AS (
    SELECT Invoice, MAX(Year) AS Year, MAX(Month) AS Month, SUM(Revenue) as total_sales
    FROM sales
    WHERE IsCancelled = 0
    GROUP BY Invoice
    )
SELECT Year, Month,
ROUND(AVG(total_sales), 2) AS month_average_revenue,
ROUND(AVG(AVG(total_sales)) OVER(ORDER BY Year, Month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS months_3_average_revenue
FROM monthly_orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- name: rank_countries
--Query 3: Compiles average and total revenue of countries, ranking them based on total revenue of the country
--Used flags: IsNotStandardGeography

SELECT country_clean,
CASE WHEN IsNotStandardGeography = 0 THEN 'Standard'
ELSE 'Non-Standard' END AS country_type,
ROUND(AVG(Revenue), 2) AS average_revenue,
ROUND(SUM(Revenue), 2) AS total_revenue,
RANK() OVER(ORDER BY SUM(Revenue) DESC) AS revenue_rank
FROM sales
WHERE IsServiceCode = 0 AND IsCancelled = 0
GROUP BY country_clean
ORDER BY total_revenue DESC;

-- name: final_revenue
--Query 4: Calculates overall legit sales, cancelled sales and bad debts
--Used flags: IsCancelled, IsBadDebt

SELECT
ROUND(SUM(CASE WHEN IsCancelled = 0 AND IsBadDebt = 0 THEN Revenue ELSE 0 END), 2) AS legit_sales,
SUM(CASE WHEN IsCancelled = 1 THEN Revenue ELSE 0 END) AS cancelled_sales,
SUM(CASE WHEN IsBadDebt = 1 THEN Revenue ELSE 0 END) AS bad_debt
FROM sales;

-- name: users_comparison
--Query 5: Counts the number of guest and regular users, and their average check per order
--Used flags: IsGuest, IsCancelled

WITH total_sales AS(
    SELECT Invoice, MAX(IsGuest) AS IsGuest, SUM(Revenue) AS order_total
    FROM sales
    WHERE IsCancelled = 0
    GROUP BY Invoice
    )
SELECT IsGuest, ROUND(AVG(order_total), 2) AS average_value,
COUNT(DISTINCT Invoice) AS total_count
FROM total_sales
GROUP BY IsGuest;

-- name: days_revenue
--Query 6: Counts the average and total revenue per day
--Used flags: IsCancelled, IsServiceCode

SELECT DayOfWeekStr, ROUND(AVG(Revenue), 2) AS average_revenue,
SUM(Revenue) AS total_revenue
FROM sales
WHERE IsCancelled = 0 AND IsServiceCode = 0
GROUP BY DayOfWeekStr
ORDER BY average_revenue DESC;
