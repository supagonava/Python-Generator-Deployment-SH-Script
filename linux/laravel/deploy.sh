cp /var/wwwroot/%APP_NAME%/deployments/site.prod.conf /etc/nginx/sites-available/site-%APP_NAME%.conf
cp /var/wwwroot/%APP_NAME%/deployments/db-site.prod.conf /etc/nginx/sites-available/db-%APP_NAME%.conf

sudo unlink /etc/nginx/sites-enabled/site-%APP_NAME%.conf
sudo unlink /etc/nginx/sites-enabled/db-%APP_NAME%.conf
sudo ln -s /etc/nginx/sites-available/site-%APP_NAME%.conf /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/db-%APP_NAME%.conf /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled
sudo cp /var/wwwroot/%APP_NAME%/deployments/supervisor.prod.conf /etc/supervisor/conf.d/%APP_NAME%.conf

sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/public
sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/storage
sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/vendor
sudo chown -R www-data:www-data /var/wwwroot/phpmyadmin

systemctl restart php8.1-fpm
sudo service supervisor restart && service nginx restart
sudo supervisorctl status
