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
	ON DELETE SET NULL 
	);

DROP TABLE IF EXISTS 聯絡人;
DROP TABLE IF EXISTS 客戶;

INSERT INTO 客戶(客戶名稱)
VALUES('遠傳電信'),
      ('台灣大車隊');

INSERT INTO 聯絡人(客戶id,聯絡人姓名,電話,郵件)
VALUES (1,'JOHN Doe','0972185666','john.doe@bluebird.dev'),
      (1,'JOHN Doe','0972185666','jaaahn.doe@bluebird.dev'),
      (2,'JOHN Doe','0972185666','john.doe@bluebird.dev');

DELETE FROM 客戶
WHERE 客戶_id = 1

SELECT * FROM 客戶;
SELECT * FROM 聯絡人;








