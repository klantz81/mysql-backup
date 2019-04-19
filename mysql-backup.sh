#!/bin/bash

databases=`/usr/bin/mysql -NB --user=root --execute="SHOW DATABASES" | grep -Ev "(information_schema|performance_schema)"`

for db in $databases
do
	/usr/bin/mysqldump --lock-tables --user=root --databases $db > "/root/mysql-backups/$db.sql"
#	/usr/bin/mysqldump --lock-tables --user=root --databases $db | gzip > "/root/mysql-backups/$db.sql.gz"
#	/usr/bin/mysqldump --single-transaction --user=root --databases $db > "/root/mysql-backups/$db.sql"
#	/usr/bin/mysqldump --single-transaction --user=root --databases $db | gzip > "/root/mysql-backups/$db.sql.gz"
done
