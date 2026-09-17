USE ecomm;
SELECT 
COUNT(*) AS Total_Rows,
SUM(WarehouseToHome IS NULL) AS Missing_WarehouseToHome,
SUM(HourSpendOnApp IS NULL) AS Missing_HourSpendOnApp,
SUM(OrderAmountHikeFromlastYear IS NULL) AS Missing_OrderAmountHike,
SUM(DaySinceLastOrder IS NULL) AS Missing_DaySinceLastOrder,
SUM(Tenure IS NULL) AS Missing_Tenure,
SUM(CouponUsed IS NULL) AS Missing_CouponUsed,
SUM(OrderCount IS NULL) AS Missing_OrderCount
FROM customer_churn;

USE ecomm;
SELECT
ROUND(AVG(WarehouseToHome)) AS Mean_WarehouseToHome,
ROUND(AVG(HourSpendOnApp)) AS Mean_HourSpendOnApp,
ROUND(AVG(OrderAmountHikeFromlastYear)) AS Mean_OrderAmountHike,
ROUND(AVG(DaySinceLastOrder)) AS Mean_DaySinceLastOrder
FROM customer_churn;

SET SQL_SAFE_UPDATES = 0;

UPDATE customer_churn
SET WarehouseToHome = 16
WHERE WarehouseToHome IS NULL;

UPDATE customer_churn
SET HourSpendOnApp = 3
WHERE HourSpendOnApp IS NULL;

UPDATE customer_churn
SET OrderAmountHikeFromlastYear = 16
WHERE OrderAmountHikeFromlastYear IS NULL;

UPDATE customer_churn
SET DaySinceLastOrder = 5
WHERE DaySinceLastOrder IS NULL;

SELECT Tenure
FROM customer_churn
WHERE Tenure IS NOT NULL
GROUP BY Tenure
ORDER BY COUNT(*) DESC
LIMIT 1;
UPDATE customer_churn
SET Tenure = 1
WHERE Tenure IS NULL;

SELECT CouponUsed
FROM customer_churn
WHERE CouponUsed IS NOT NULL
GROUP BY CouponUsed
ORDER BY COUNT(*) DESC
LIMIT 1;
UPDATE customer_churn
SET CouponUsed = 1
WHERE CouponUsed IS NULL;

SELECT OrderCount
FROM customer_churn
WHERE OrderCount IS NOT NULL
GROUP BY OrderCount
ORDER BY COUNT(*) DESC
LIMIT 1;
UPDATE customer_churn
SET OrderCount = 2
WHERE OrderCount IS NULL;

SELECT *
FROM customer_churn
WHERE WarehouseToHome > 100;
DELETE FROM customer_churn
WHERE WarehouseToHome > 100;
SELECT *
FROM customer_churn
WHERE WarehouseToHome > 100;

SELECT DISTINCT PreferredLoginDevice
FROM customer_churn;
SELECT DISTINCT PreferedOrderCat
FROM customer_churn;
SELECT DISTINCT PreferredPaymentMode
FROM customer_churn;

UPDATE customer_churn
SET PreferredLoginDevice = 'Mobile Phone'
WHERE PreferredLoginDevice = 'Phone';

UPDATE customer_churn
SET PreferedOrderCat = 'Mobile Phone'
WHERE PreferedOrderCat = 'Mobile';

UPDATE customer_churn
SET PreferredPaymentMode = 'Credit Card'
WHERE PreferredPaymentMode = 'CC';

UPDATE customer_churn
SET PreferredPaymentMode = 'Cash on Delivery'
WHERE PreferredPaymentMode = 'COD';

SELECT DISTINCT PreferredLoginDevice
FROM customer_churn;

SELECT DISTINCT PreferedOrderCat
FROM customer_churn;

SELECT DISTINCT PreferredPaymentMode
FROM customer_churn;

ALTER TABLE customer_churn
RENAME COLUMN PreferedOrderCat TO PreferredOrderCat;
ALTER TABLE customer_churn
RENAME COLUMN HourSpendOnApp TO HoursSpentOnApp;
DESCRIBE customer_churn;

ALTER TABLE customer_churn
ADD COLUMN ComplaintReceived VARCHAR(3);
UPDATE customer_churn
SET ComplaintReceived = 'Yes'
WHERE Complain = 1;
UPDATE customer_churn
SET ComplaintReceived = 'No'
WHERE Complain = 0;
SELECT Complain, ComplaintReceived
FROM customer_churn;

ALTER TABLE customer_churn
ADD COLUMN ChurnStatus VARCHAR(7);
UPDATE customer_churn
SET ChurnStatus = 'Churned'
WHERE Churn = 1;
UPDATE customer_churn
SET ChurnStatus = 'Active'
WHERE Churn = 0;
SELECT Churn, ChurnStatus
FROM customer_churn;

ALTER TABLE customer_churn
DROP COLUMN Churn,
DROP COLUMN Complain;
DESCRIBE customer_churn;

SELECT ChurnStatus, COUNT(*) AS CustomerCount
FROM customer_churn
GROUP BY ChurnStatus;

SELECT
AVG(Tenure) AS AverageTenure,
SUM(CashbackAmount) AS TotalCashbackAmount
FROM customer_churn
WHERE ChurnStatus = 'Churned';

SELECT COUNT(*) AS ChurnedAndComplained
FROM customer_churn
WHERE ChurnStatus = 'Churned'
AND ComplaintReceived = 'Yes';
SELECT COUNT(*) AS TotalChurned
FROM customer_churn
WHERE ChurnStatus = 'Churned';
SELECT 508 * 100.0 / 948 AS ComplaintPercentage;

SELECT
(COUNT(*) / (SELECT COUNT(*)
    FROM customer_churn
    WHERE ChurnStatus = 'Churned')) * 100.0
  AS ComplaintPercentage
FROM customer_churn
WHERE ChurnStatus = 'Churned'
AND ComplaintReceived = 'Yes';

SELECT CityTier, COUNT(*) AS ChurnedCustomers
FROM customer_churn
WHERE ChurnStatus = 'Churned'
AND PreferredOrderCat = 'Laptop & Accessory'
GROUP BY CityTier
ORDER BY ChurnedCustomers DESC
LIMIT 1;

SELECT PreferredPaymentMode, COUNT(*) AS CustomerCount
FROM customer_churn
WHERE ChurnStatus = 'Active'
GROUP BY PreferredPaymentMode
ORDER BY CustomerCount DESC
LIMIT 1;

SELECT SUM(OrderAmountHikeFromlastYear) AS TotalOrderAmountHike
FROM customer_churn
WHERE MaritalStatus = 'Single'
AND PreferredOrderCat = 'Mobile Phone';

SELECT AVG(NumberOfDeviceRegistered) AS AverageDevices
FROM customer_churn
WHERE PreferredPaymentMode = 'UPI';

SELECT CityTier, COUNT(*) AS CustomerCount
FROM customer_churn
GROUP BY CityTier
ORDER BY CustomerCount DESC
LIMIT 1;

SELECT Gender, SUM(CouponUsed) AS TotalCoupons
FROM customer_churn
GROUP BY Gender
ORDER BY TotalCoupons DESC
LIMIT 1;

SELECT PreferredOrderCat,
 COUNT(*) AS CustomerCount,
 MAX(HoursSpentOnApp) AS MaximumHoursSpent
FROM customer_churn
GROUP BY PreferredOrderCat;

SELECT SUM(OrderCount) AS TotalOrderCount
FROM customer_churn
WHERE PreferredPaymentMode = 'Credit Card'
  AND SatisfactionScore = (
	SELECT MAX(SatisfactionScore)
	FROM customer_churn);
    
SELECT AVG(SatisfactionScore) AS AverageSatisfactionScore
FROM customer_churn
WHERE ComplaintReceived = 'Yes';

SELECT PreferredOrderCat, COUNT(*) AS CustomerCount
FROM customer_churn
WHERE CouponUsed > 5
GROUP BY PreferredOrderCat;

SELECT PreferredOrderCat, AVG(CashbackAmount) AS AverageCashback
FROM customer_churn
GROUP BY PreferredOrderCat
ORDER BY AverageCashback DESC
LIMIT 3;

SELECT PreferredPaymentMode, AVG(Tenure) AS AverageTenure,
 SUM(OrderCount) AS TotalOrders
FROM customer_churn
GROUP BY PreferredPaymentMode
HAVING AVG(Tenure) >= 10 AND SUM(OrderCount) > 500;


SELECT
    CASE
	WHEN WarehouseToHome <= 5 THEN 'Very Close Distance'
	WHEN WarehouseToHome <= 10 THEN 'Close Distance'
	WHEN WarehouseToHome <= 15 THEN 'Moderate Distance' 
    ELSE 'Far Distance'
END AS DistanceCategory, ChurnStatus, COUNT(*) AS CustomerCount
FROM customer_churn
GROUP BY DistanceCategory, ChurnStatus
ORDER BY DistanceCategory, ChurnStatus;

SELECT * FROM customer_churn
WHERE MaritalStatus = 'Married'
AND CityTier = 1
AND OrderCount > (
	SELECT AVG(OrderCount)
	FROM customer_churn
  );
  
USE ecomm;
CREATE TABLE customer_returns (
    ReturnID INT,
    CustomerID INT,
    ReturnDate DATE,
    RefundAmount INT
);
INSERT INTO customer_returns
(ReturnID, CustomerID, ReturnDate, RefundAmount)
VALUES
(1001, 50022, '2023-01-01', 2130),
(1002, 50316, '2023-01-23', 2000),
(1003, 51099, '2023-02-14', 2290),
(1004, 52321, '2023-03-08', 2510),
(1005, 52928, '2023-03-20', 3000),
(1006, 53749, '2023-04-17', 1740),
(1007, 54206, '2023-04-21', 3250),
(1008, 54838, '2023-04-30', 1990);
SELECT * FROM customer_returns;

SELECT *
FROM customer_returns
JOIN customer_churn
ON customer_returns.CustomerID = customer_churn.CustomerID
WHERE customer_churn.ChurnStatus = 'Churned'
AND customer_churn.ComplaintReceived = 'Yes';