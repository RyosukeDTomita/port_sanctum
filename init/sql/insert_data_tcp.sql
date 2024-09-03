LOAD DATA INFILE '/docker-entrypoint-initdb.d/init/port_tcp.csv'
INTO TABLE port_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(port, service);
SELECT COUNT(*) FROM port_info;
SELECT * FROM port_info LIMIT 10;
