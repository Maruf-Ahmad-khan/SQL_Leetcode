USE DEMO;
SELECT * FROM SMARTPHONES;

/* Find the name and rating of the worst rated apple phone*/
SELECT 
    MODEL, RATING
FROM
    SMARTPHONES
WHERE
    BRAND_NAME = 'APPLE'
ORDER BY RATING ASC LIMIT 1;

/*Group by using SQL */
/* Group smartphones by brand and get the count, average price,
max rating, avg screen size and avg battery capacity */
SELECT 
    BRAND_NAME,
    COUNT(*) AS 'NUMBER_PHONES',
    ROUND(AVG(PRICE), 2) AS 'AVERAGE PRICE',
    MAX(RATING) AS 'MAXIMUM RATING',
    ROUND(AVG(SCREEN_SIZE), 2) AS 'SCREEN_SIZE',
    ROUND(AVG(BATTERY_CAPACITY), 2) AS 'AVERAGE BATTERY CAPACITY'
FROM
    SMARTPHONES
GROUP BY BRAND_NAME
ORDER BY BRAND_NAME DESC;