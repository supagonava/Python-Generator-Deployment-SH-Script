# Nginx certbot
sudo apt-get update
sudo apt-get install -y pkg-config libcairo2-dev libgirepository1.0-dev
sudo apt-get install python3-pip python3-dev libpq-dev nginx curl
sudo apt install certbot python3-certbot-nginx

# PHP 8.1
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-xml php8.1-zip

# Mysql
sudo apt-get install mysql-server
sudo mysql_secure_installation
sudo mysql -u root -p

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

# Supervisor
sudo apt-get install supervisor
sudo service supervisor restart