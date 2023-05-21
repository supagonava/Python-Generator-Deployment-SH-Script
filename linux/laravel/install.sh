# Nginx certbot
sudo apt-get update &&
apt-get install -y pkg-config libcairo2-dev libgirepository1.0-dev &&
apt-get install python3-pip python3-dev libpq-dev nginx curl &&
apt install certbot python3-certbot-nginx -y

sudo ufw enable
sudo ufw allow 22 && ufw allow 80 && ufw allow 443 && ufw allow 3306 && ufw allow 6379

# Supervisor
sudo apt-get install supervisor

# PHP 8.1
sudo add-apt-repository ppa:ondrej/php
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip php8.1-fpm
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php8.1-fpm

# Mysql
sudo apt-get install mysql-server &&
mysql_secure_installation &&
mysql -u root -p

# After the last command, you'll be in the MySQL shell. Execute the following commands there:
CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY '#db@dm_in2023';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost';
FLUSH PRIVILEGES;
exit

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# PHP Myadmin
sudo apt-get install phpmyadmin
sudo unlink /var/wwwroot/phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/wwwroot/phpmyadmin

# Copy config file
cd /var/wwwroot/%APP_NAME%
cp deployments/nginx.prod.conf /etc/nginx/sites-available/nginx.prod.conf
sudo rm /etc/supervisor/conf.d/supervisor.conf
sudo cp deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf
sudo unlink /etc/nginx/sites-enabled/nginx.prod.conf
sudo ln -s /etc/nginx/sites-available/nginx.prod.conf /etc/nginx/sites-enabled


# Disable apache2
sudo service apache2 stop && systemctl disable apache2 && service nginx start

# Restart
sudo service supervisor restart && service nginx restart