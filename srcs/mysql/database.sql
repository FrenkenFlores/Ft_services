CREATE DATABASE wordpress_database;
CREATE USER 'fflores'@'localhost' IDENTIFIED BY 'fflores';
GRANT ALL PRIVILEGES ON *.* TO 'fflores'@'localhost';
FLUSH PRIVILEGES;