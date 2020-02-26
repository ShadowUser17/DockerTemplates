1) docker exec -it mysql bash
2) id
3) mkdir -p mysql && sudo chown 27:27 mysql
4) mysql_secure_installation
5) mysql -u root -p
6) CREATE USER 'dbadm'@'%' IDENTIFIED BY '1qaz!QAZ';
7) GRANT ALL PRIVILEGES ON *.* TO 'dbadm'@'%' WITH GRANT OPTION;
8) FLUSH PRIVILEGES;
