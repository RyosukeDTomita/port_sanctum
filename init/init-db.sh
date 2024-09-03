#!/bin/bash
# NOTE: user作成後に作ったDBに対しては権限が付与されなくなるので先にtableを作成している。
echo "-----create user-----"
mysql < "/docker-entrypoint-initdb.d/init/sql/create_user.sql"
echo "-----create db and table-----"
mysql < "/docker-entrypoint-initdb.d/init/sql/create_table.sql"
echo "-----insert tcp port-----"
mysql -u sigma -ppassword tcp < "/docker-entrypoint-initdb.d/init/sql/insert_data_tcp.sql"
#mysql -u sigma -ppassword udp < "/docker-entrypoint-initdb.d/init/sql/insert_data_udp.sql"

