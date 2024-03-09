SELECT * FROM public.payment
ORDER BY payment_id ASC LIMIT 100

SELECT DISTINCT customer_id
FROM payment
GROUP BY customer_id

SELECT customer_id, COUNT(*) AS 筆數
FROM payment
GROUP BY customer_id;

/*取出PAYMENT的所有客戶的應收帳款總合,SUM()*/
SELECT customer_id, SUM(amount) AS 總合 
FROM payment
GROUP BY customer_id
ORDER BY 總合 DESC;



