-- Write your query below
/*SELECT T1.customer_id, customer_name
    FROM customers T1
    INNER JOIN orders T2
    ON T1.customer_id = T2.customer_id
    GROUP BY T1.customer_id, customer_name
    HAVING */
    

SELECT o.customer_id, c.customer_name
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
    WHERE product_name IN ('A', 'B')
    GROUP BY o.customer_id, c.customer_name
    HAVING COUNT(DISTINCT product_name) = 2
    AND o.customer_id NOT IN (
        SELECT customer_id FROM orders
        WHERE product_name = 'C'
    )
    ORDER BY customer_name