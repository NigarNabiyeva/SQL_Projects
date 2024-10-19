--1. Let's look all the data
SELECT *
FROM credit_card_transaction;

--2.How many credit card transactions have been made?
SELECT COUNT(*) AS 'Number of Transaction'
FROM credit_card_transaction
WHERE Transaction_Amount IS NOT NULL;

--3. What are the unique categories present in the credit_card_transaction table?
SELECT DISTINCT Category
FROM credit_card_transaction;

--4. Calculate the total, average, maximum, and minimum transaction amounts.
SELECT
	SUM(Transaction_Amount) AS Total_Amount,
	AVG(Transaction_Amount) AS Average_Amount,
	MAX(Transaction_Amount) AS Maximum_Amount,
	MIN(Transaction_Amount) AS Minimum_Amount
FROM credit_card_transaction;

--5. Count the number of transactions per month and year in the credit_card_transaction table, sorted by year and month.
SELECT
	YEAR(Date) AS Year,
	MONTH(Date) AS Month,
	COUNT(*) AS 'Number of Transaction'
FROM credit_card_transaction
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

--6. Count the number of transactions for each gender.
SELECT 
	Gender,
	COUNT(*) AS 'Number of Transactions'
FROM credit_card_transaction
GROUP BY Gender;

--7.  Retrieve all customers and their age.
SELECT 
	Customer_ID,
	Name,
	Surname,
	DATEDIFF(YEAR, Birthdate, GETDATE()) AS Age
FROM credit_card_transaction;

--8. Categorize customers by age (Young, Middle Aged, Old Aged) and calculate the number of customers and total transaction amount for each age category. Sort the results by the total transaction amount in descending order.
SELECT 
	CASE
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 18 AND 35 THEN 'Young'
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 36 AND 65 THEN 'Middle Aged'
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) > 65 THEN 'Old Aged'
	END AS 'Age Categories',
	COUNT(*) AS 'Number of Customers',
	SUM(Transaction_Amount) AS 'Total Amount of Transaction'
FROM credit_card_transaction
GROUP BY 
	CASE
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 18 AND 35 THEN 'Young'
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) BETWEEN 36 AND 65 THEN 'Middle Aged'
		WHEN DATEDIFF(YEAR, Birthdate, GETDATE()) > 65 THEN 'Old Aged'
	END
ORDER BY 'Total Amount of Transaction' DESC;

--9. Retrieve the top 10 transactions with the highest Transaction_Amount along with the corresponding Customer_ID, Name, Surname, Category, and calculated age. Sort the results by Transaction_Amount in descending order.
SELECT 
	TOP 10 Transaction_Amount,
	Customer_ID,
	Name,
	Surname,
	Category,
	DATEDIFF(YEAR, Birthdate, GETDATE()) AS Age
FROM credit_card_transaction
ORDER BY Transaction_Amount DESC;

--10. Retrieve the top 10 transactions with the lowest Transaction_Amount along with the corresponding Customer_ID, Name, Surname, Category, and calculated age. Sort the results by Transaction_Amount in ascending order.
SELECT 
	TOP 10 Transaction_Amount,
	Customer_ID,
	Name,
	Surname,
	Category,
	DATEDIFF(YEAR, Birthdate, GETDATE()) AS Age
FROM credit_card_transaction
ORDER BY Transaction_Amount ASC;

--11. Calculate the total transaction amount for each category in the credit_card_transaction table and sort the results by the total amount in descending order.
SELECT
	Category,
	SUM(Transaction_Amount) AS 'Total Amount of Transaction' 
FROM credit_card_transaction
GROUP BY Category
ORDER BY SUM(Transaction_Amount) DESC;

/* --12. Retrieve information about merchants with multiple transactions, including: 
The name of the merchant, 
The total number of transactions for the merchant, 
The sum of all transaction amounts for the merchant, 
The average transaction amount for the merchant, 
The highest transaction amount for the merchant, 
The lowest transaction amount for the merchant. 
Group the results by Merchant_Name and filter for merchants with more than one transaction. Order the results by the number of transactions in descending order.
*/
SELECT 
	Merchant_Name, 
	COUNT(Transaction_Amount) AS 'Number of Transactions',
	SUM(Transaction_Amount) AS 'Total Amount of Transaction',
	AVG(Transaction_Amount) AS 'Average Amount of Transaction',
	MAX(Transaction_Amount) AS 'Maximum Amount of Transaction',
	MIN(Transaction_Amount) AS 'Minimum Amount of Transaction'
FROM credit_card_transaction
GROUP BY merchant_name
HAVING COUNT(Transaction_Amount) > 1
ORDER BY COUNT(Transaction_Amount) DESC;

--13. Retrieve information about customers as a categorized label based on the transaction amount (High Spender, Moderate Spender, Low Spender).
SELECT 
	Customer_ID, 
	Name,
	Surname,
	Transaction_Amount,
	Category,
		CASE
           WHEN transaction_amount > 200000 THEN 'High Spender'
           WHEN transaction_amount BETWEEN 100000 AND 200000 THEN 'Moderate Spender'
           ELSE 'Low Spender'
		END AS Spending_Category
FROM credit_card_transaction
ORDER BY Transaction_Amount DESC;

--14. Find the date with the highest number of transactions.
SELECT 
	Date, 
	COUNT(*) AS 'Number of Transactions'
FROM credit_card_transaction
GROUP BY Date
ORDER BY COUNT(*) DESC;

--15. Identify customers who have made multiple transactions.
SELECT 
	Customer_ID, 
	COUNT(*) AS Repeat_Transactions
FROM credit_card_transaction
GROUP BY Customer_ID
HAVING COUNT(*) > 1;