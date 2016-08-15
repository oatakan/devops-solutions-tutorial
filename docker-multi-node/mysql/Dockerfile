FROM ubuntu:14.04

MAINTAINER Orcun Atakan <oatakan@gmail.com>

# install mysql.
RUN \
  apt-get update && apt-get install -yq mysql-server-5.6 && \
  rm -rf /var/lib/apt/lists/* && \
  sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
  sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
  echo "mysqld_safe &" > /tmp/runme && \
  echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/runme && \
  echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/runme && \
  bash /tmp/runme && \
  rm -f /tmp/runme

# define volumes to be mounted
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

# Define working directory.
WORKDIR /data

EXPOSE 3306
CMD ["mysqld_safe"]