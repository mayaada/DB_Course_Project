-- (1) Scalar Function that gets returns the total amount of the items in the cart
-- by order number

DROP FUNCTION Cart_Total

CREATE FUNCTION Cart_Total (@Order_Number VARCHAR(50))
RETURNS MONEY
AS BEGIN

        DECLARE @Total MONEY

        SELECT  @Total = SUM(I.Quantity * P.Price)
        FROM    INCLUDES AS I JOIN PRODUCTS AS P ON (I.Product_ID = P.Product_ID)
        WHERE   I.Order_Number = @Order_Number
        GROUP BY I.Order_Number

        RETURN  @Total
        END

-- Test Query (Function 1)
SELECT  C.Email, C.Name_First, C.Name_Last, O.Order_Number, Cart_Total = dbo.Cart_Total(O.Order_Number)
FROM    CUSTOMERS AS C JOIN CREDIT_CARDS AS CC ON (C.Email = CC.Email) 
        JOIN ORDERS AS O ON (CC.CC_Number = O.CC_Number)
WHERE   C.Address_Country = 'Poland'
GROUP BY C.Email, C.Name_First, C.Name_Last, O.Order_Number


-- (2) Table Function that returns a table of the items a client has searched

DROP FUNCTION Client_Search_History

CREATE FUNCTION Client_Search_History (@Email VARCHAR(50), @Limit_Searches INT)
RETURNS TABLE
AS RETURN

    SELECT TOP (@Limit_Searches)  S.Product_ID, P.Product_Type
    FROM   SEARCHES AS S JOIN PRODUCTS AS P ON S.Product_ID = P.Product_ID
    WHERE  S.Email = @Email

-- Test Querys (Function 2)

SELECT *
FROM dbo.Client_Search_History('jplott2f@oracle.com', 2)

SELECT *
FROM dbo.Client_Search_History('svarran2b@flickr.com', 4)

