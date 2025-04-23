USE movies;
SELECT * FROM sampledata;
SELECT Customer_Name FROM sampledata
WHERE Customer_Id IN (SELECT Customer_Id FROM sampledata WHERE 
YEAR(Order_Date) = 2019); 

SELECT Customer_Id, SUM(Sale) FROM sampledata
WHERE Customer_Id IN (SELECT Customer_Id FROM sampledata)
GROUP BY Customer_Id;


