-- LOOK UP TABLE - COUNTRIES
CREATE TABLE COUNTRIES(
   Country VARCHAR(50) NOT NULL PRIMARY KEY);


INSERT INTO COUNTRIES (Country) VALUES
 ('India'), ('United States'), ('Indonesia'), ('Brazil'), ('Pakistan'), ('Nigeria'), ('Bangladesh'), ('Russia'), ('Japan'), 
 ('Mexico'), ('Philippines'), ('Vietnam'), ('Ethiopia'), ('Egypt'), ('Germany'), ('Iran'), ('Turkey'), 
 ('Democratic Republic of the Congo'), ('Thailand'), ('France'), ('United Kingdom'), ('Italy'), ('Burma'), 
 ('South Africa'), ('South Korea'), ('Colombia'), ('Spain'), ('Ukraine'), ('Tanzania'), ('Kenya'), ('Argentina'), ('Algeria'), 
 ('Poland'), ('Sudan'), ('Uganda'), ('Canada'), ('Iraq'), ('Morocco'), ('Peru'), ('Uzbekistan'), ('Saudi Arabia'), ('Malaysia'), 
 ('Venezuela'), ('Nepal'), ('Afghanistan'), ('Yemen'), ('North Korea'), ('Ghana'), ('Mozambique'), ('Taiwan'), ('Australia'), 
 ('Ivory Coast'), ('Syria'), ('Madagascar'), ('Angola'), ('Cameroon'), ('Sri Lanka'), ('Romania'), ('Burkina Faso'), ('Niger'), 
 ('Kazakhstan'), ('Netherlands'), ('Chile'), ('Malawi'), ('Ecuador'), ('Guatemala'), ('Mali'), ('Cambodia'), ('Senegal'), ('Zambia'), 
 ('Zimbabwe'), ('Chad'), ('South Sudan'), ('Belgium'), ('Cuba'), ('Tunisia'), ('Guinea'), ('Greece'), ('Portugal'), ('Rwanda'), 
 ('Czech Republic'), ('Somalia'), ('Haiti'), ('Benin'), ('Burundi'), ('Bolivia'), ('Hungary'), ('Sweden'), ('Belarus'), 
 ('Dominican Republic'), ('Azerbaijan'), ('Honduras'), ('Austria'), ('United Arab Emirates'), ('Israel'), ('Switzerland'), 
 ('Tajikistan');

CREATE TABLE CUSTOMERS (
    Email                   VARCHAR(50)    NOT NULL     PRIMARY KEY,
    Name_First              VARCHAR(20)    NOT NULL, 
    Name_Last               VARCHAR(20)    NOT NULL,
    Address_L1              VARCHAR(50)    NOT NULL,
    Address_L2              VARCHAR(20)    NULL,
    Address_Country         VARCHAR(50)    NOT NULL, 
    Address_City            VARCHAR(50)    NOT NULL,
    Address_Postal_Code     INTEGER        NOT NULL, 
    Phone                   VARCHAR(15)    NOT NULL, 
    Password                VARCHAR(20)    NOT NULL
);

ALTER TABLE CUSTOMERS ADD CONSTRAINT CK_Email CHECK (Email like '%@%.%');
ALTER TABLE CUSTOMERS ADD CONSTRAINT CKֹ_Password CHECK (len(password) >= 5 and len(password) <=40);
ALTER TABLE CUSTOMERS ADD CONSTRAINT CKֹ_Postal_Code CHECK (Address_Postal_Code > 0);
ALTER TABLE CUSTOMERS ADD CONSTRAINT CKֹ_Phone CHECK (Phone LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE CUSTOMERS ADD CONSTRAINT FK_Country FOREIGN KEY (Address_Country)  
            REFERENCES COUNTRIES (Country);

-- LOOKUP TABLE - PRODUCT TYPE
CREATE TABLE PRODUCT_TYPES(
   Product_Type VARCHAR(20) NOT NULL PRIMARY KEY
);

INSERT INTO PRODUCT_TYPES(Product_Type) VALUES
 ('Lipstick')
,('Lipgloss')
,('Concealer')
,('Liquid Foundation')
,('Cream Foundation')
,('Nail Polish');


CREATE TABLE PRODUCTS (
    Product_ID	           SMALLINT	      NOT NULL    PRIMARY KEY , 
    Product_Type             VARCHAR(20)    NOT NULL,
    Price		             MONEY		    NOT NULL,
);

ALTER TABLE PRODUCTS ADD CONSTRAINT CK_Price CHECK (Price >= 0);

ALTER TABLE PRODUCTS ADD CONSTRAINT FK_Product_Type FOREIGN KEY (Product_Type)  
            REFERENCES PRODUCT_TYPES (Product_Type);

-- LOOKUP TABLE CUSTOMIZATION TYPES
CREATE TABLE CUSTOMIZATION_TYPES(
   Customization_Type   VARCHAR(20)     NOT NULL    PRIMARY KEY);

INSERT INTO CUSTOMIZATION_TYPES(Customization_Type) VALUES
 ('Formula'), ('Shimmer'), ('Aroma'), ('Additives'), ('Customize');

-- LOOKUP TABLE CUSTOMER_CHOICES

CREATE TABLE CUSTOMER_CHOICES(
   Customer_Choice VARCHAR(20) NOT NULL PRIMARY KEY);

INSERT INTO CUSTOMER_CHOICES(Customer_Choice) VALUES
 ('TEA TREE'), ('SHEA BUTTER'), ('OIL CONTROL'), ('ANTI-AGING'), ('BOTH'), ('STRAWBERRY'), ('VANILLA'), ('PEPPERMINT'), 
 ('GOLD'), ('PINK'), ('WHITE'), ('NONE'), ('FULL'), ('MATTE'), ('CREAM'), ('SHEER'),  ('GRAPEFRUIT'), ('CBD');

CREATE TABLE CUSTOMIZATIONS (
    Customization_Type      VARCHAR(20)    NOT NULL,
    Customer_Choice         VARCHAR(20)    NOT NULL,
    CONSTRAINT  PK_Customizations   PRIMARY KEY (Customization_Type, Customer_Choice)    
);


ALTER TABLE CUSTOMIZATIONS  ADD CONSTRAINT FK_Customization_Type FOREIGN KEY (Customization_Type)  
            REFERENCES CUSTOMIZATION_TYPES (Customization_Type);

ALTER TABLE CUSTOMIZATIONS ADD CONSTRAINT FK_Customer_Choice FOREIGN KEY (Customer_Choice)  
            REFERENCES CUSTOMER_CHOICES (Customer_Choice);

CREATE TABLE SHIPPINGS (
    Shipping_Method             VARCHAR(25)    NOT NULL    PRIMARY KEY, 
    Shipping_Price              SMALLMONEY          NOT NULL
);

ALTER TABLE SHIPPINGS ADD CONSTRAINT CK_Shipping_Price CHECK (Shipping_Price >= 0);

CREATE TABLE CREDIT_CARDS(
    CC_Number            VARCHAR(16)           NOT NULL PRIMARY KEY,
    Owner_Name           VARCHAR(40)           NOT NULL,
    Expiration_Date      DATE                  NOT NULL,
    CVV                  VARCHAR(3)            NOT NULL,
    Email                VARCHAR(50)           NOT NULL,
    CONSTRAINT  FK_CC_Email  FOREIGN KEY (Email)
                REFERENCES CUSTOMERS(Email)
);

ALTER TABLE CREDIT_CARDS ADD CONSTRAINT CK_CC CHECK (CC_Number LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE CREDIT_CARDS ADD CONSTRAINT CK_CVV CHECK (CVV LIKE ('[0-9][0-9][0-9]'));

-- LOOKUP TABLE COLORS

CREATE TABLE COLORS (
   Color VARCHAR(25) NOT NULL PRIMARY KEY
);

INSERT INTO COLORS (Color) VALUES
 ('Chirstmas Red'), ('Sculpture'), ('Rocket Red'), ('Chianti'), ('Katrina'), ('BailonBasos'), ('Natalie Lipstick'),
('Blanco'), ('Pinkberry'), ('Alison'), ('Rose Gold'), ('Rose Pop Lipstick'), ('Undress'), ('Patty'), ('Erica'), ('Lori'), 
('Spicy Mauve Lipstick'), ('Bangs Lipstick'), ('Keris Kiss'), ('Faye'), ('Pink Shine Lipstick'), ('Mario Pinched My Lips'), 
('Glum Plum Lipstick'), ('African Violet'), ('Love'), ('Luscious'), ('Garden Daisy'), ('Firecracker'), ('Classic Red'), 
('Dollface'), ('Naked'), ('Flossy'), ('Bombshell'), ('Rose Quartz'), ('Daiquiri'), ('Rizzo'), ('Sugar & Spice'), ('Soho'), 
('Siret'), ('Feeling It'), ('Pinch My Lips'), ('Pinkstone'), ('Foxy'), ('Amethyst'), ('Merlot'), ('Besos'), ('Allure'), 
('Cardinal'), ('Moonwalk'), ('Champagne Sparkle'), ('Holiday Rose'), ('1 Blue'), ('2 Blue'), ('3 Tan'), ('3 Blue'), ('4 Tan'), 
('4 Blue'), ('5 Tan'), ('5 Blue'), ('6 Tan'), ('6 Blue'), ('8 Blue'), ('10 Blue'), ('10 Tan'), ('12 Blue'), ('14 Umber'), 
('16 Umber'), ('18 Umber'), ('Bannana'), ('Ivory'), ('Ivory Beige'), ('Light Olive'), ('Peachy'), ('Medium Olive'), ('Olive'), 
('Mocha'), ('Spicy Move'), ('Pink Shine'), ('Natalie'), ('Laurie'), ('Lauren'), ('Blushing Bride'), ('Greg'), ('Tulip'), ('Glum Plum'), 
('Christmas Red'), ('Garber Daisy'), ('Albizzel'), ('Twilight'), ('Grape'), ('Ebony'), ('Ultra Violet'), ('Blooming');


CREATE TABLE CART_ITEMS (
    Product_ID			        SMALLINT        NOT NULL,
    Cart_Item_ID		          INT        NOT NULL,
    Color				          VARCHAR(25)    NOT NULL,
    CONSTRAINT  PK_CART_ITEMS     PRIMARY KEY (Product_ID, Cart_Item_ID),
    CONSTRAINT  FK_P_Product_ID   FOREIGN KEY (Product_ID)
			REFERENCES PRODUCTS (Product_ID)
);

ALTER TABLE CART_ITEMS ADD CONSTRAINT FK_Color FOREIGN KEY (Color)  
            REFERENCES COLORS (Color);

CREATE TABLE ORDERS (
    Order_Number                  VARCHAR (50)    NOT NULL    PRIMARY KEY, 
    Order_Date                    DATE            NOT NULL,
    Shipping_Method               VARCHAR(25)     NOT NULL,
    CC_Number                     VARCHAR(16)     NOT NULL, 

    CONSTRAINT FK_O_Shipping_Method FOREIGN KEY (Shipping_Method)
    			REFERENCES SHIPPINGS (Shipping_Method),
    CONSTRAINT FK_O_CC_Number FOREIGN KEY (CC_Number)
			REFERENCES CREDIT_CARDS (CC_Number)
);



CREATE TABLE SEARCHES (
    Product_ID		           SMALLINT		   NOT NULL,
    Email                        VARCHAR(50)	 NOT NULL,
    CONSTRAINT PK_SEARCHES PRIMARY KEY (Product_ID,Email),
    CONSTRAINT FK_S_Product_ID FOREIGN KEY (Product_ID)
    			REFERENCES PRODUCTS (Product_ID),
    CONSTRAINT FK_S_Email FOREIGN KEY (Email)
    			REFERENCES CUSTOMERS (Email)
);



CREATE TABLE CUSTOMIZES (
    Customization_Type          VARCHAR(20)       NOT NULL,
    Customer_Choice             VARCHAR(20)       NOT NULL,
    Product_ID                  SMALLINT           NOT NULL,
    Cart_Item_ID                INT           NOT NULL,
    CONSTRAINT      PK_Customizes PRIMARY KEY (Customization_Type, Customer_Choice, Product_ID,Cart_Item_ID),

    CONSTRAINT      FK_C_Customizations FOREIGN KEY (Customization_Type, Customer_Choice)
                    REFERENCES CUSTOMIZATIONS (Customization_Type, Customer_Choice), 

    CONSTRAINT      FK_C_Cart_Items FOREIGN KEY (Product_ID, Cart_Item_ID)
                    REFERENCES CART_ITEMS (Product_ID, Cart_Item_ID)
);


CREATE TABLE INCLUDES (
Product_ID		            SMALLINT             NOT NULL,
Cart_Item_ID		          INT             NOT NULL,
Order_Number		          VARCHAR(50)         NOT NULL,
Quantity			          SMALLINT             NOT NULL,
CONSTRAINT PK_Includes PRIMARY KEY (Product_ID, Cart_Item_ID, Order_Number),

CONSTRAINT FK_I_Cart_Items FOREIGN KEY (Product_ID, Cart_Item_ID)
                REFERENCES CART_ITEMS (Product_ID, Cart_Item_ID),

CONSTRAINT FK_I_Order_Number FOREIGN KEY (Order_Number)
			REFERENCES ORDERS (Order_Number)
);

ALTER TABLE INCLUDES ADD CONSTRAINT CK_Positive_Quantity CHECK (Quantity >= 0);

-- LOOKUP TABLE SHIPPINGS

INSERT INTO SHIPPINGS (Shipping_Method, Shipping_Price) VALUES 
('International Shipping', 25),
('Free Standard Shipping', 0),
('Standard Shipping', 6),
('Express Shipping', 25)


-- LOOKUP TABLE CUSTOMIZATIONS

INSERT INTO CUSTOMIZATIONS(Customization_Type,Customer_Choice) VALUES
 ('Formula','SHEER')
,('Formula','FULL')
,('Formula','MATTE')
,('Shimmer','GOLD')
,('Shimmer','PINK')
,('Shimmer','WHITE')
,('Shimmer','NONE')
,('Aroma','STRAWBERRY')
,('Aroma','VANILLA')
,('Aroma','PEPPERMINT')
,('Aroma','GRAPEFRUIT')
,('Aroma','NONE')
,('Additives','CBD')
,('Customize','NONE')
,('Customize','TEA TREE')
,('Customize','SHEA BUTTER')
,('Customize','OIL CONTROL')
,('Customize','ANTI-AGING')
,('Customize','BOTH');



 -- TASK 1 - Queries

 --- Query 1 (Un-Nested)

SELECT  O.Order_Number, S.Shipping_Price, Order_Total = SUM(I.Quantity * P.PRICE), Difference = SUM(I.Quantity * P.PRICE) - S.Shipping_Price
FROM    ORDERS AS O JOIN SHIPPINGS AS S ON (O.Shipping_Method = S.Shipping_Method)
       JOIN INCLUDES AS I ON (O.Order_Number = I.Order_Number) JOIN PRODUCTS AS P ON (I.Product_ID = P.Product_ID)
       JOIN CREDIT_CARDS AS CC ON (O.CC_Number = CC.CC_Number)
       JOIN CUSTOMERS AS C ON (CC.Email = C.Email)
WHERE   C.Address_Country LIKE 'Poland'
GROUP BY O.Order_Number, S.Shipping_Price
HAVING   SUM(I.Quantity * P.PRICE) > 75


-- Query 2 (Un_Nested)

SELECT  P.Product_Type, 
Revenue = SUM (I.Quantity * P.PRICE)
FROM ORDERS AS O JOIN INCLUDES AS I
ON O.Order_Number = I.Order_Number
JOIN PRODUCTS AS P ON P.Product_ID  = I.Product_ID 
WHERE   YEAR(O.Order_Date) > 2000 AND YEAR(O.Order_Date) < 2010
GROUP BY P.Product_Type
ORDER BY SUM (I.Quantity * P.PRICE) DESC

 -- Query 3 (Nested)

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


-- Query 4 (Nested)
 
SELECT Product_Type
FROM PRODUCTS
WHERE Product_Type NOT IN (
   SELECT DISTINCT P.Product_Type
   FROM ORDERS AS O JOIN INCLUDES AS I
   ON O.Order_Number = I.Order_Number
   JOIN PRODUCTS AS P ON P.Product_ID = I.Product_ID
WHERE YEAR(O.Order_Date) = '2010')


-- Query 5 (DELETE)

DELETE
FROM CUSTOMERS
WHERE CUSTOMERS.Email NOT IN (
	SELECT
	C.Email
	FROM ORDERS AS O JOIN CREDIT_CARDS AS CC 
	ON (O.CC_Number  = CC.CC_Number  )
	JOIN CUSTOMERS AS C ON CC.Email = C.Email)


-- Query 6 (Intersect)

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



-- TASK 2 - Advanced SQL Functions


-- VIEW

CREATE VIEW V_REVENUE AS (

	SELECT 
	Product_Type  , 
	A.[product's revenue] , 
	[Proportion] = A.[product's revenue] / B.[Total revenue]
	FROM 
		(SELECT 
		P.Product_Type ,
		[product's revenue] = SUM(I.Quantity * P.Price)
		FROM ORDERS AS O JOIN INCLUDES AS I
		ON O.Order_Number = I.Order_Number
		JOIN PRODUCTS AS P
		ON I.Product_ID = P.Product_ID
		GROUP BY P.Product_Type) AS A , 
		(SELECT 
		[Total revenue] = SUM(I.Quantity * P.Price)
		FROM ORDERS AS O JOIN INCLUDES AS I
		ON O.Order_Number = I.Order_Number
		JOIN PRODUCTS AS P
		ON I.Product_ID = P.Product_ID) AS B
	GROUP BY Product_Type , A.[product's revenue] , B.[Total revenue]
)

SELECT *
FROM    V_REVENUE

-- FUNCTION 1 - SCALAR 

DROP FUNCTION Total_Revenue_By_Date_Range

CREATE FUNCTION Total_Revenue_By_Date_Range (@First_Date DATE, @Second_Date DATE)
RETURNS Money
AS
BEGIN
    DECLARE @Total_Revenue Money
    SELECT @Total_Revenue = SUM(I.Product_ID * I.Quantity * P.Price)
    FROM INCLUDES AS I JOIN PRODUCTS AS P ON (I.Product_ID = P.Product_ID) JOIN
	ORDERS AS O ON O.Order_Number=I.Order_Number
    WHERE O.Order_Date >= @First_date AND O.Order_Date <= @Second_date
    RETURN @Total_Revenue
END


-- Test Query (Function 1)

SELECT  Total_Revenue = dbo.Total_Revenue_By_Date_Range('2011-11-02', '2022-01-14')


-- FUNCTION 2 - TABLE

DROP FUNCTION Client_Search_History

CREATE FUNCTION Client_Search_History (@Email VARCHAR(50), @Limit_Searches INT)
RETURNS TABLE
AS RETURN

    SELECT TOP (@Limit_Searches)  S.Product_ID, P.Product_Type
    FROM   SEARCHES AS S JOIN PRODUCTS AS P ON S.Product_ID = P.Product_ID
    WHERE  S.Email = @Email

-- TRIGGER

ALTER TABLE CREDIT_CARDS ADD Number_Of_Orders int 

UPDATE  CREDIT_CARDS 
SET Number_Of_Orders =
			(SELECT COUNT(ORDERS.Order_Number)
			FROM ORDERS 
			WHERE ORDERS.CC_Number = CREDIT_CARDS.CC_Number)

DROP TRIGGER UPDATE_Total_Orders

CREATE TRIGGER UPDATE_Total_Orders
ON ORDERS 
FOR INSERT , UPDATE 
AS 
	UPDATE CREDIT_CARDS SET Number_Of_Orders  = 
			(SELECT COUNT(ORDERS.Order_Number)
			FROM ORDERS 
			WHERE ORDERS.CC_Number = CREDIT_CARDS.CC_Number)

WHERE CREDIT_CARDS.CC_Number
		
IN (SELECT DISTINCT CC_Number
	FROM inserted )


-- STORED PROCEDURE

Drop PROCEDURE SP_UpdateProductPrice

CREATE PROCEDURE SP_UpdateProductPrice @New_Price int, @ProductId Tinyint
AS
   if(@New_Price >= 0 AND @New_Price <= 255) begin
   UPDATE products
   SET price = cast(@New_Price as Tinyint)
   WHERE Product_ID = @ProductId;

   PRINT 'Price has been updated to ' + CAST(@New_Price as varchar) + ' for PRODUCTId ' + CAST(@ProductId as varchar)
   END
   Else
   PRINT 'Price should be grather than 0 and smaller than 255'


-- TASK 4 - ADVANCED SQL


-- WINDOW FUNCTION QUERY 1 - PRODUCT RANK BY YEARS

SELECT 
	YEAR(O.Order_Date) AS YEAR , 
	P.Product_Type , 
	REVENUE = SUM(I.Quantity ) * P.Price , 
	SUM(SUM(I.Quantity ) * P.Price) OVER (PARTITION BY YEAR(O.Order_Date)) as total_sales , 
	RANK() OVER (PARTITION BY YEAR(O.Order_Date) ORDER BY (SUM(I.Quantity ) * P.Price)) AS RANK
FROM
	ORDERS AS O 
	JOIN INCLUDES AS I ON O.Order_Number = I.Order_Number 
	JOIN PRODUCTS AS P ON P.Product_ID = I.Product_ID
GROUP BY 
	YEAR(O.Order_Date) , 
	P.Product_Type , P.Price

---- WINDOW FUNCTION QUERY 2

SELECT 
	MONTH(O.Order_Date) AS MONTH , 
	P.Product_ID , 
	sales = SUM(I.Quantity ) * P.Price ,
	LAG(SUM(I.Quantity ) * P.Price, 1) OVER (ORDER BY MONTH(O.Order_Date)) as previous_month_sales , 
	LEAD(SUM(I.Quantity ) * P.Price, 1) OVER (ORDER BY MONTH(O.Order_Date)) as next_month_sales , 
	ROUND((SUM(I.Quantity ) * P.Price) - AVG(SUM(I.Quantity ) * P.Price) OVER (ORDER BY MONTH(O.Order_Date)
	ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING),2) as PROPORTION_TO_MONTHLY_AVERAGE
FROM
	ORDERS AS O 
	JOIN INCLUDES AS I ON O.Order_Number = I.Order_Number 
	JOIN PRODUCTS AS P ON P.Product_ID = I.Product_ID
WHERE
	YEAR (O.Order_Date) = 2022 AND P.Product_ID = 1
GROUP BY 
	MONTH(O.Order_Date) , P.Product_ID ,P.Price

-- SEVERAL TOOL INTEGRATION

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

-- WITH REPORT


-- function for WITH use

DROP FUNCTION Country_Proportion

CREATE FUNCTION Country_Proportion (@Country VARCHAR(50))
RETURNS REAL
AS BEGIN

        DECLARE @Country_Revenue REAL
        DECLARE @Total_Revenue REAL

        SELECT  @Country_Revenue = SUM(O.Total_Order_Price)
        FROM    CUSTOMERS AS C JOIN CREDIT_CARDS AS CC ON (C.Email = CC.Email)
                JOIN ORDERS AS O ON (CC.CC_Number = O.CC_Number)
        WHERE   C.Address_Country = @Country

        SELECT  @Total_Revenue = SUM(O.Total_Order_Price)
        FROM    CUSTOMERS AS C JOIN CREDIT_CARDS AS CC ON (C.Email = CC.Email)
                JOIN ORDERS AS O ON (CC.CC_Number = O.CC_Number)

        RETURN  ROUND((@Country_Revenue/@Total_Revenue), 2)
        END

-- with query

    WITH 
	TOP_REVENUE_COUNTRY AS (
		SELECT TOP 6 C.Address_Country, SUM (I.Quantity * P.PRICE) as Total_Revenue, Proportion_Rate_To_Company_Revenue = dbo.Country_Proportion(C.Address_Country),
		RANK() OVER (ORDER BY SUM (I.Quantity * P.PRICE) DESC) as Rank
		FROM PRODUCTS as P join Includes as I On P.Product_ID=I.Product_ID
		join ORDERS as O on o.Order_Number=I.Order_Number join CREDIT_CARDS as CC on cc.CC_Number=O.CC_Number
		join CUSTOMERS as C on c.Email=cc.Email
		GROUP BY C.Address_Country) , 

	COUNTRY_SEARCHES as (SELECT 
		C.Address_Country , 
		Searches = COUNT(S.Product_ID) 
		FROM SEARCHES AS S JOIN CUSTOMERS AS C
		ON S.Email = C.Email
		JOIN TOP_REVENUE_COUNTRY AS F ON F.Address_Country = C.Address_Country
		GROUP BY C.Address_Country), 

     LAST_ORDER_DATE AS (  SELECT      
        C.Address_Country, MAX(O.Order_Date) AS Last_Order_Date
        FROM  CUSTOMERS AS C JOIN CREDIT_CARDS AS CC ON (C.Email = CC.Email)
        JOIN ORDERS AS O ON (CC.CC_Number = O.CC_Number)
        GROUP BY  C.Address_Country),

     PRODUCTS_SOLD AS (SELECT
        Address_Country, SUM(I.Quantity) AS Quantity_Sold 
        FROM PRODUCTS as P join Includes as I On P.Product_ID=I.Product_ID
        join ORDERS as O on o.Order_Number=I.Order_Number join CREDIT_CARDS as CC on cc.CC_Number=O.CC_Number
        join CUSTOMERS as C on c.Email=cc.Email
        GROUP BY C.Address_Country), 

     SEARCHES_ENDED_IN_SALE AS (SELECT 
        A.COUNTRY as Country , 
        COUNT(A.PRODUCT) AS Purchased
        FROM 
        ((SELECT Country = C.Address_Country, Product = S.Product_ID, C.Email AS CONTECT
        FROM SEARCHES AS S JOIN CUSTOMERS AS C ON S.Email = C.Email
        GROUP BY C.Address_Country, C.Email , S.Product_ID)
        INTERSECT
        (SELECT  C.Address_Country,I.Product_ID, C.Email
        FROM ORDERS AS O JOIN INCLUDES AS I ON O.Order_Number = I.Order_Number    
        JOIN CREDIT_CARDS AS CC  ON CC.CC_Number = O.CC_Number   
        JOIN CUSTOMERS AS C ON C.Email = CC.Email
        GROUP BY C.Address_Country, C.Email , I.Product_ID)) AS A
        GROUP BY A.COUNTRY)

		SELECT 
		T.Address_Country, L.Last_Order_Date, C.Searches, S.Purchased, P.Quantity_Sold, T.Total_Revenue, T.Proportion_Rate_To_Company_Revenue , 
		T.Rank
		FROM TOP_REVENUE_COUNTRY AS T 
		JOIN COUNTRY_SEARCHES AS C
		ON T.Address_Country = C.Address_Country
		JOIN LAST_ORDER_DATE AS L
		ON L.Address_Country = T.Address_Country
		JOIN PRODUCTS_SOLD AS P
		ON P.Address_Country = T.Address_Country
		JOIN SEARCHES_ENDED_IN_SALE AS S
		ON S.Country = T.Address_Country
                ORDER BY T.Rank







