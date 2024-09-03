FROM debian:bookworm-20240812-slim

# create mysql user
ARG USER_NAME="mysql"
RUN <<EOF
addgroup ${USER_NAME}
adduser --ingroup ${USER_NAME} --gecos "mysql user" --shell /bin/bash --no-create-home --disabled-password ${USER_NAME}
EOF

# install mysql
RUN <<EOF
apt-get update -y
apt-get install -y --no-install-recommends default-mysql-server
rm -rf /var/lib/lists
EOF

# set up mysql
RUN <<EOF
mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
sed -i 's/^bind-address[[:space:]]*= 127\.0\.0\.1$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
EOF

COPY ./init/ /docker-entrypoint-initdb.d/init/
COPY docker-entrypoint.sh /usr/local/bin/

RUN <<EOF
chmod +x /usr/local/bin/docker-entrypoint.sh
chmod +x /docker-entrypoint-initdb.d/init/init-db.sh
EOF

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
USER mysql
CMD ["mysqld"]
