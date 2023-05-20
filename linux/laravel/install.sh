# Nginx certbot
sudo apt-get update &&
apt-get install -y pkg-config libcairo2-dev libgirepository1.0-dev &&
apt-get install python3-pip python3-dev libpq-dev nginx curl &&
apt install certbot python3-certbot-nginx -y

# Supervisor
sudo apt-get install supervisor

# PHP 8.1
sudo add-apt-repository ppa:ondrej/php &&
apt-get install php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip

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
sudo ln -s /usr/share/phpmyadmin /var/wwwroot/phpmyadmin

# Copy config file
cp deployments/nginx.prod.conf /etc/nginx/sites-available/nginx.prod.conf
sudo ln -s /etc/nginx/sites-available/nginx.prod.conf /etc/nginx/sites-enabled
sudo rm /etc/supervisor/conf.d/supervisor.conf
sudo cp deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf

# Restart Worker
sudo service supervisor restart
sudo service nginx restart