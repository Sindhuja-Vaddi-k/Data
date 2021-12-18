create or replace view v_products_quantity as
(
SELECT 
P.PROD_DETAIL_ID as PROD_DETAIL_ID,
P.PROD_NAME as PROD_NAME ,
SUM(L.QUANTITY) as total_quantity 
FROM LINE_ITEMS L, product_details P
WHERE l.prod_detail_id = p.prod_detail_id
GROUP BY P.PROD_DETAIL_ID,
P.PROD_NAME
);