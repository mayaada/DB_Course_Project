-- Query 1

SELECT  O.Order_Number, S.Shipping_Price, Order_Total = SUM(I.Quantity * P.PRICE), Difference = SUM(I.Quantity * P.PRICE) - S.Shipping_Price
FROM    ORDERS AS O JOIN SHIPPINGS AS S ON (O.Shipping_Method = S.Shipping_Method) 
        JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number) JOIN PRODUCTS AS P ON (I. = P.Product_ID)
        JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
        JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
WHERE   C.Address_Country LIKE 'United States'
GROUP BY O.Order_Number, S.Shipping_Price
HAVING   S.Shipping_Price > SUM(I.Quantity * P.PRICE)


-- Query 2

SELECT  P.Product_Type, 
Revenue = SUM (I.Quantity * P.PRICE)
FROM ORDERS AS O JOIN INCLUDES AS I
ON O.Order_Number = I.Order_Number
JOIN PRODUCTS AS P ON P.Product_ID  = I.Product_ID 
WHERE   YEAR(O.Order_Date) > 2000 AND YEAR(O.Order_Date) < 2010
GROUP BY P.Product_Type
ORDER BY SUM (I.Quantity * P.PRICE) DESC



-- Query 3

SELECT I.Product_ID, Number_Of_Searches = COUNT(S.Product_ID),
Num_Of_Purchases = COUNT (I.Product_ID), Conversion_Rate = SUM (I.Quantity)/COUNT(*)
FROM ORDERS AS O JOIN INCLUDES AS I ON O.Order_Number = I.Order_Number
     JOIN SEARCHES AS S ON I.Product_ID = S.Product_ID
WHERE I.Product_ID IN (
		SELECT TOP 3 Product_ID  
		FROM SEARCHES 
		GROUP BY Product_ID 
		ORDER BY COUNT (Product_ID) DESC)
GROUP BY I.Product_ID
ORDER BY COUNT (I.Product_ID)



SELECT *
FROM ORDERS AS O LEFT JOIN INCLUDES AS I ON O.Order_Number = I.Order_Number
     


SELECT TOP 1 I.Product_ID ,
Num_Of_Purchases = SUM (I.Quantity)
FROM ORDERS AS O JOIN INCLUDES AS I
ON O.Order_Number = I.Order_Number
WHERE I.Product_ID IN (
       SELECT TOP 3 Product_ID 
       FROM SEARCHES
       GROUP BY Product_ID
       ORDER BY COUNT (Product_ID) DESC)
GROUP BY I.Product_ID
ORDER BY SUM (I.Quantity)




-- Query 3 Nested

SELECT Product_Type
FROM PRODUCTS
WHERE Product_Type NOT IN (
	SELECT DISTINCT P.Product_Type
	FROM ORDERS AS O JOIN INCLUDES AS I
	ON O.Order_Number = I.Order_Number
	JOIN PRODUCTS AS P ON P.Product_ID = I.Product_ID
WHERE YEAR(O.Order_Date) = '2022')


-- Query DELETE

DELETE
FROM CUSTOMERS
WHERE CUSTOMERS.Email NOT IN (
	SELECT
	C.Email
	FROM ORDERS AS O JOIN CREDIT_CARDS AS CC 
	ON (O.CC_Number  = CC.CC_Number  )
	JOIN CUSTOMERS AS C ON CC.Email = C.Email )





-- Query Intersect

SELECT  Lipgloss_Lipstick_Orders = COUNT (DISTINCT C.Email)
FROM    CUSTOMERS AS C
WHERE   C.Email IN (SELECT  C.Email
                    FROM    ORDERS AS O JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number)
                            JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
                            JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
                    WHERE   I.Product_ID = '1'
                    
                    INTERSECT
                    
                    SELECT  C.Email
                    FROM    ORDERS AS O JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number)
                            JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
                            JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
                    WHERE   I.Product_ID = '2')






-- ordered lipstick
SELECT  C.Email
FROM    ORDERS AS O JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number)
        JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
        JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
WHERE   I.Product_ID = '1'


-- ordered lipgloss

SELECT  C.Email
FROM    ORDERS AS O JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number)
        JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
        JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
WHERE   I.Product_ID = '2'