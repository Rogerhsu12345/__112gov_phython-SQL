DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS gate_count;

CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY,
	名稱 VARCHAR(20) NOT NULL,
	英文名稱 VARCHAR(50),
    地名 VARCHAR(20),
	英文地名 VARCHAR(50),
	地址 VARCHAR(255),
	英文地址 VARCHAR(255),
	電話 VARCHAR(20),
	GPS VARCHAR(50),
	YOUBIKE BOOL
);

SELECT * FROM stations;
SELECT * FROM gate_count;

SELECT COUNT(*) AS 筆數
FROM stations;

SELECT COUNT(*) AS 筆數
FROM gate_count;


CREATE TABLE IF NOT EXISTS gate_count(
    id SERIAL,
	日期 DATE,
	站點編號 INT,
	進站人數 INT DEFAULT 0,
    出站人數 INT DEFAULT 0,
    PRIMARY KEY(id),
	FOREIGN KEY(站點編號) REFERENCES stations(編號)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號=編號;


SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號;


/*基隆市有哪些火車站*/
SELECT DISTINCT 名稱
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 地址 LIKE '基隆市%';

/*基隆火車站2022年3月1日資料,'2022-03-01'*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 = '基隆' AND 日期 = '2022-03-01';

/*取出基隆火車站 2022-03月份資料 時間由小到大排序*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 = '基隆' AND (日期 BETWEEN '2022-03-01' AND '2022-03-31')
ORDER BY 日期 ASC;

/*取出基隆火車站 台北火車站 2022-03月份資料 時間由小到大排序*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號
WHERE 名稱 IN('台北','基隆') AND (日期 BETWEEN '2022-03-01' AND '2022-03-31')
ORDER BY 日期 ASC;

/*取出資料進站人數最多的前10筆資料*/
SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號
ORDER BY 進站人數 DESC
LIMIT 100;

/* */
SELECT 日期,進站人數,出站人數,名稱,地名,地址,YOUBIKE
FROM gate_count LEFT JOIN stations ON 站點編號=編號
ORDER BY 進站人數 DESC
LIMIT 100;

/*全省各站點2022年進站總人數*/
SELECT 名稱, 
SUM(進站人數) AS 該站總人數 
FROM gate_count LEFT JOIN stations ON 站點編號=編號
GROUP BY 名稱
ORDER BY 該站總人數 DESC;

/*全省各站點2022年進站總人數大於5佰萬人的站點 */
SELECT 名稱, 
SUM(進站人數) AS 該站總人數 
FROM gate_count LEFT JOIN stations ON 站點編號=編號
GROUP BY 名稱
HAVING SUM(進站人數)> 50000000;

/* 基隆火車站2020年,每月份進站人數 */


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







