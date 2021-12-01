#!/bin/bash
 2
  # Add a new MySQL user prompt for username and password and build add user script
  
 3 # Ask the user for their name
 4 echo MySQL/MariaDB User creation and Access
 5 echo '-------------------------------------'
 6
 7 read -p 'Username               : ' username
 8 read -sp 'Password (not echoed) : ' password
 9
10 echo Creating user on MariaDB....
11
12
13 echo "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password'; " >>  mysql_adduser.sql
14 echo "CREATE USER '$username'@'%' IDENTIFIED BY '$password';" >> mysql_adduser.sql
15 echo "GRANT ALL ON *.* TO '$username'@'localhost';" >> mysql_adduser.sql
16 echo "GRANT ALL ON *.* TO '$username'@'%';" >> mysql_adduser.sql
17 echo "flush privileges;" >> mysql_adduser.sql
18
19  mysql  -u root  < mysql_adduser.sql
20
21 echo "Users $username  successfully created on local MariaDB instance""
