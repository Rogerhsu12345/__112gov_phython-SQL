DROP TABLE IF EXISTS 客戶;

CREATE TABLE IF NOT EXISTS 客戶(
	客戶_id SERIAL,
	客戶名稱 VARCHAR(255) NOT NULL,
    PRIMARY KEY(客戶_id)
);

CREATE TABLE IF NOT EXISTS 聯絡人(
	聯絡人id SERIAL,
	客戶id int,
	聯絡人姓名 VARCHAR(255) NOT NULL,
	電話 VARCHAR(15),
	郵件 VARCHAR(100),
	PRIMARY KEY(聯絡人id),
	FOREIGN KEY(客戶id) REFERENCES 客戶(客戶_id)	
	);

DROP TABLE IF EXISTS 聯絡人
DROP TABLE IF EXISTS 客戶