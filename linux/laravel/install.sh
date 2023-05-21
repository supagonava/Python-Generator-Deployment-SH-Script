# Nginx certbot
sudo apt-get update &&
apt-get install -y pkg-config libcairo2-dev libgirepository1.0-dev &&
apt-get install python3-pip python3-dev libpq-dev nginx curl &&
apt install certbot python3-certbot-nginx -y
sudo apt install ttf-mscorefonts-installer

sudo ufw enable
sudo ufw allow 22 && ufw allow 80 && ufw allow 443 && ufw allow 3306 && ufw allow 6379

# Supervisor
sudo apt-get install supervisor

# PHP 8.1
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip php8.1-fpm php8.1-odbc php8.1-soap

# Mysql -1
sudo apt-get install mysql-server &&
mysql_secure_installation &&
mysql -u root -p

# Mysql -2
CREATE USER 'dbadmin_root'@'%' IDENTIFIED BY '#db@dm_in2023';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin_root'@'%';
FLUSH PRIVILEGES;
exit

ALTER USER 'dbadmin_root'@'%' IDENTIFIED WITH mysql_native_password BY '#db@dm_in2023';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin_root'@'%';
FLUSH PRIVILEGES;
exit

# Mysql -3 Allow online
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# -> bind-address = 0.0.0.0

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
