-- Write your query below
SELECT
    s.seller_name
FROM orders AS o
RIGHT JOIN seller AS s
     ON s.seller_id = o.seller_id AND EXTRACT(YEAR FROM o.sale_date)= 2020
 WHERE o.order_id IS NULL 
 ORDER BY s.seller_name ASC