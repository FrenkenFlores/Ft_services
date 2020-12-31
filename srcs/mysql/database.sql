CREATE DATABASE wordpress_database;
CREATE USER 'fflores'@'%' IDENTIFIED BY 'fflores';
GRANT ALL PRIVILEGES ON wordpress_database . * TO 'fflores'@'%';
FLUSH PRIVILEGES;