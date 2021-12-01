#!/bin/bash

# Ask the user for their name
echo MySQL/MariaDB User creation and Access
echo '-------------------------------------'
 
read -p 'Username               : ' username
read -sp 'Password (not echoed) : ' password

echo Creating user on MariaDB....


echo "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password'; " >>  mysql_adduser.sql
echo "CREATE USER '$username'@'%' IDENTIFIED BY '$password';" >> mysql_adduser.sql
echo "GRANT ALL ON *.* TO '$username'@'localhost';" >> mysql_adduser.sql
echo "GRANT ALL ON *.* TO '$username'@'%';" >> mysql_adduser.sql
echo "flush privileges;" >> mysql_adduser.sql


 mysql  -u root  < mysql_adduser.sql

 echo "Maraidb/MySQL User: $username ADDED successfully"
