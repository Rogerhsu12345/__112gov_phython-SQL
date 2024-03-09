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

/*基隆火車站2022年3月1日資料*/








