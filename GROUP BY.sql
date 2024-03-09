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

/* */
SELECT first_name || ' ' ||last_name AS full_name, 
SUM(amount) AS 總合 
FROM payment LEFT JOIN customer ON payment.customer_id=customer.customer_id
GROUP BY full_name
ORDER BY 總合 DESC;

/* */
SELECT first_name || ' ' ||last_name AS full_name, 
/* || ' ' ||表示字串相連*/
SUM(amount) AS 總合 
FROM payment LEFT JOIN customer USING (customer_id)
/*USING 表示兩不同表格,但均具有相同customer_id資料join在一起 */
GROUP BY full_name
HAVING SUM(amount) >= 200
/*GROUP BY 與 HAVING用在一起,HAVING後面一樣用具合函數 */
ORDER BY 總合 DESC;




