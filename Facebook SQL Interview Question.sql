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
   ROUND(ctr, 0)
AS
  ctr
FROM
  CTE;
   
