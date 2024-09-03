#!/bin/bash
# NOTE: user作成後に作ったDBに対しては権限が付与されなくなるので先にtableを作成している。
mysql < "/docker-entrypoint-initdb.d/init/sql/create_user.sql"
mysql < "/docker-entrypoint-initdb.d/init/sql/create_table.sql"
mysql -u sigma -ppassword mydb < "/docker-entrypoint-initdb.d/init/sql/insert_data.sql"

