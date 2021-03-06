CREATE OR REPLACE VIEW VPRODUCT_REVIEWS AS
(
SELECT 
PC.CATEGORY_NAME ,
PD.PROD_NAME,
V.VENDOR_NAME,
R.COMMENTS,
R.RATING,
C.CUST_ID,
C.CUST_FIRST_NAME ||' ' || C.CUST_LAST_NAME || ' ' || C.CUST_MIDDLE_NAME AS CUSTOMER_NAME,
C.CUST_GENDER
FROM 
CUSTOMER C,
REVIEWS R,
PRODUCT_DETAILS PD,
PRODUCT_CATEGORY PC,
VENDOR V
WHERE C.CUST_ID = R.CUST_ID
AND R.PROD_DETAIL_ID = PD.PROD_DETAIL_ID
AND PD.CATEGORY_ID = PC.CATEGORY_ID
AND PD.VENDOR_ID = V.VENDOR_ID
--AND C.CUST_ID = 'CUST-123';
);