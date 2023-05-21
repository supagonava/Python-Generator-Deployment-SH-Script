cp /var/wwwroot/%APP_NAME%/deployments/site.prod.conf /etc/nginx/sites-available/site.conf
cp /var/wwwroot/%APP_NAME%/deployments/db-site.prod.conf /etc/nginx/sites-available/db.conf
cp /var/wwwroot/%APP_NAME%/deployments/default.prod.conf /etc/nginx/sites-available/default
cp /var/wwwroot/%APP_NAME%/deployments/nginx.prod.conf /etc/nginx/nginx.conf

sudo unlink /etc/nginx/sites-enabled/site.conf
sudo unlink /etc/nginx/sites-enabled/db.conf
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/db.conf /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled
sudo cp /var/wwwroot/%APP_NAME%/deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf

sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/public
sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/storage
sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/vendor

sudo chown -R www-data:www-data /var/wwwroot/phpmyadmin
systemctl restart php8.1-fpm
sudo service supervisor restart && service nginx restart