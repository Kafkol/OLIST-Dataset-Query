
select* from dbo.olist_order_items_dataset$

select* from dbo.olist_customers_dataset$
select* from dbo.olist_geolocation_dataset$
select* from dbo.olist_order_payments_dataset$
select* from dbo.olist_orders_dataset$
select* from dbo.olist_products_dataset$
select* from dbo.olist_sellers_dataset$
select* from dbo.product_category_name_translati$

--Converting date/time format to date



select order_approved_at, convert (date, order_approved_at) orderapprovedat
from dbo.olist_orders_dataset$

ALTER TABLE olist_orders_dataset$
ADD orderapprovedat DATE;

UPDATE olist_orders_dataset$
SET orderapprovedat = convert (date, order_approved_at);


select order_delivered_carrier_date, convert (date, order_delivered_carrier_date) orderdeliveredcarrierdate
from dbo.olist_orders_dataset$

ALTER TABLE olist_orders_dataset$
ADD orderdeliveredcarrier DATE;

UPDATE olist_orders_dataset$
SET orderdeliveredcarrierdate = convert (date, order_delivered_carrier_date);


select order_delivered_customer_date, convert (date, order_delivered_customer_date) orderdeliveredcustdate
from dbo.olist_orders_dataset$

ALTER TABLE olist_orders_dataset$
ADD orderdeliveredcustdate DATE;

UPDATE olist_orders_dataset$
SET orderdeliveredcustdate = convert (date, order_delivered_customer_date);


select order_estimated_delivery_date, convert (date, order_estimated_delivery_date) orderestidelidate
from dbo.olist_orders_dataset$

ALTER TABLE olist_orders_dataset$
ADD orderestidelidate DATE;

UPDATE olist_orders_dataset$
SET orderestidelidate = convert (date, order_estimated_delivery_date);

select* from dbo.olist_order_items_dataset$

select shipping_limit_date, convert (date, shipping_limit_date) shippinglimitdate
from  dbo.olist_order_items_dataset$

ALTER TABLE olist_order_items_dataset$
ADD shippinglimitdate DATE;

UPDATE olist_order_items_dataset$
SET shippinglimitdate= convert (date,shipping_limit_date);



--Remove Null from product_category_name
select* from dbo.olist_products_dataset$

SELECT product_weight_g, COUNT(*) as num_occurrences
FROM dbo.olist_products_dataset$
GROUP BY product_weight_g;

DELETE FROM dbo.olist_products_dataset$
WHERE product_category_name IS NULL;

SELECT product_category_name, COUNT(*) as num_occurrences2
FROM dbo.product_category_name_translati$
GROUP BY product_category_name;

SELECT geolocation_city, COUNT(*) as num_occurrences3
FROM dbo.olist_geolocation_dataset$
GROUP BY geolocation_city


select* from dbo.olist_geolocation_dataset$

--Cleaning of misspelt city names

UPDATE dbo.olist_geolocation_dataset$
SET geolocation_city = REPLACE(geolocation_city, 'botuporã�', 'botupora') 
WHERE  geolocation_city LIKE '%botuporã%';

select* from dbo.olist_customers_dataset$
select* from dbo.olist_geolocation_dataset$
select* from dbo.olist_order_payments_dataset$
select* from dbo.olist_orders_dataset$
select* from dbo.olist_products_dataset$
select* from dbo.olist_sellers_dataset$
select* from dbo.product_category_name_translati$
select* from dbo.product_category_name_translati$
select* from dbo.olist_order_reviews_dataset$

SELECT order_id, COUNT(*) as count
FROM (
  SELECT order_id, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_id) as row_num
  FROM olist_order_payments_dataset$
) subquery
WHERE row_num > 1
GROUP BY order_id

SELECT *, COUNT(*) as count
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY column1, column2, ... ORDER BY column1, column2, ...) as row_num
  FROM table_name
) subquery
WHERE row_num > 1
GROUP BY column_name


DELETE FROM olist_order_payments_dataset$
WHERE order_id IN (
  SELECT order_id
  FROM (
    SELECT order_id, ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_id) as row_num
    FROM 
  ) subquery
  WHERE row_num > 1
);

select* from dbo.olist_geolocation_dataset$

select Distinct(geolocation_city)
from dbo.olist_geolocation_dataset$
 
 select count(geolocation_city)
 from dbo.olist_geolocation_dataset$


SELECT COUNT(DISTINCT geolocation_city) as distinct_rows_count
FROM dbo.olist_geolocation_dataset$;

