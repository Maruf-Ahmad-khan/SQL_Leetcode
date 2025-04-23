SHOW DATABASES;
USE movies;
SHOW TABLES;

-- Read the data from app_clicks And See the Total Rows
SELECT * FROM app_click;
SELECT COUNT(*) AS Row_Counts FROM APP_CLICK;

-- Assume you have an events table on Facebook app analytics.
 -- Write a query to calculate the click-through rate (CTR)
--  for the app in 2022 and round the results to 2 decimal places.

-- Definition and note:

-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100


WITH CTE AS(
		
        SELECT 
			app_id,
            (COUNT(CASE WHEN event_type = 'click' THEN 1 END) * 100.00) / NULLIF(
            COUNT(CASE WHEN event_type = 'impression' THEN 1  END), 0)
            AS ctr
		FROM
           app_click
           
		WHERE 
             EXTRACT(YEAR FROM timestamp) = '2022'
		GROUP BY 
              app_id
)

SELECT
   app_id,
   ROUND(ctr, 2)
AS
  ctr
FROM
  CTE;
  

   
   
-- 1. **How successful is the ad campaign?**
-- Write an SQL query to calculate the
--  **percentage of impressions that resulted in clicks** across all apps.

SELECT 
   ROUND(COUNT(CASE WHEN event_type = 'click' THEN 1 END) * 100.00 / NULLIF(
   COUNT(CASE WHEN event_type = 'impression' THEN 1 END), 0), 2
   )
   AS ctr_percentage
FROM
	app_click;
    

-- 2. **Which app performed better?**
-- Compute the **click-through rate (CTR) for each app-id**
--  (percentage of clicks out of total impressions per app).

SELECT
	app_id,
    ROUND(COUNT(CASE WHEN event_type = 'click' THEN 1 END) * 100.00 / NULLIF(
    COUNT(CASE WHEN event_type = 'impression' THEN 1 END), 0), 2) AS 
    CTR
FROM
	app_click
GROUP BY
	app_id
ORDER BY 
	CTR DESC;
    
    
-- 3. **Was the first app more successful than the second?**
-- Find out which app-id had a higher 
-- **conversion percentage** (clicks/impressions * 100).

SELECT
	app_id,
    ROUND(COUNT(CASE WHEN event_type = 'click' THEN 1 END) * 100.00 / NULLIF(
    COUNT(CASE WHEN event_type = 'impression' THEN 1 END), 0), 2)
    AS Higher_conversion_percentage
FROM
	app_click
WHERE
	app_id IN(1, 2)
GROUP BY 
	app_id

     
  

  
   
