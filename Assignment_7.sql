USE MOVIES;

-- SHOW ALL DATA-- 
SELECT 
    *
FROM
    sales;
    
-- Determine the percentage of transactions where only one item (quantity = 1) was sold.--

SELECT 
    CONCAT(ROUND((COUNT(*) * 100.00) / (SELECT 
                            COUNT(*)
                        FROM
                            sales),
                    2),
            '%') AS transaction_percentage
FROM
    sales
WHERE
    quantity = 1;
    
    
    



            