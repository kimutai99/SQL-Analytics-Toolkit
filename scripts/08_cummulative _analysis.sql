
SELECT 
order_date,
total_sales,
total_price,
SUM(total_sales)  OVER(ORDER BY order_date ) AS running_total,
AVG(total_price) OVER (ORDER BY total_price) AS moving_average_price
FROM (

SELECT 
DATETRUNC(year,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS total_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year,order_date))t
ORDER BY DATETRUNC(year,order_date);
