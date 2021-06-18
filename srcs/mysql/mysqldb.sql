CREATE DATABASE wordpress_db;
CREATE USER 'fflores'@'%' IDENTIFIED BY 'fflores';
GRANT ALL PRIVILEGES ON wordpress_db . * TO 'fflores'@'%';
FLUSH PRIVILEGES;