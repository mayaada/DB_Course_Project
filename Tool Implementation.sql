-- ADDING NEW COLUMNS FOR RELEVANT FIELDS

ALTER TABLE ORDERS ADD Total_Order_Price MONEY
ALTER TABLE ORDERS ADD Available_Free_Shipping INT

-- FUNCTION TO CALCULATE TOTAL CART PRICE

DROP FUNCTION Cart_Total

CREATE FUNCTION Cart_Total (@Order_Number VARCHAR(50))
RETURNS MONEY
AS BEGIN

        DECLARE @Total MONEY
        SELECT  @Total = SUM(I.Quantity * P.Price)
        FROM    INCLUDES AS I JOIN PRODUCTS AS P ON (I.Product_ID = P.Product_ID)
        WHERE   I.Order_Number = @Order_Number
        GROUP BY I.Order_Number
        RETURN  (@Total)
        END


-- FUNCTION TO UPDATE IF ORDER IS ENTITLED FOR FREE SHIPPING 

DROP FUNCTION Free_Shipping

CREATE FUNCTION Free_Shipping (@Total_Order_Price Money)
RETURNS INT
AS
BEGIN 
	    DECLARE @If_Entitled Int
        IF @Total_Order_Price < 350
        SET @If_Entitled = 0
        ELSE
        SET @If_Entitled = 1
        RETURN (@If_Entitled)
END

-- UPDATE THE COLUMNS DATA IN ORDERS 

UPDATE ORDERS
SET Total_Order_Price = dbo.Cart_Total(ORDERS.Order_Number)

UPDATE ORDERS
SET Available_Free_Shipping = dbo.Free_Shipping(ORDERS.Total_Order_Price)


-- TRIGGER TO UPDATE Total_Order_Price

DROP TRIGGER Update_Total_Order_Price

CREATE TRIGGER Update_Total_Order_Price
ON INCLUDES 
FOR INSERT, UPDATE 
AS 
	UPDATE ORDERS 
    SET Total_Order_Price = dbo.Cart_Total(ORDERS.Order_Number)
WHERE ORDERS.Order_Number
IN (
	SELECT DISTINCT ToUpdate.Order_Number
	FROM inserted AS ToUpdate 
	)


-- CHECK TRIGGER 2

SELECT *
FROM    ORDERS
WHERE Order_Number = '1EJlscU0'


SELECT *
FROM    INCLUDES
WHERE Order_Number = '1EJlscU0'



INSERT INTO CART_ITEMS(Product_ID,Cart_Item_ID,Color) VALUES 
(4, 932568, 'Christmas Red')


INSERT INTO INCLUDES VALUES (4, 932568, '1EJlscU0', 4)


-- TRIGGER TO UPDATE Available_Free_Shipping

CREATE TRIGGER Update_Available_Free_Shipping
ON INCLUDES
AFTER UPDATE, INSERT
AS
    UPDATE ORDERS 
    SET Available_Free_Shipping = dbo.Free_Shipping(ORDERS.Total_Order_Price)
    WHERE ORDERS.Order_Number
    IN (
	SELECT DISTINCT ToUpdate.Order_Number
	FROM inserted AS ToUpdate 
	)



