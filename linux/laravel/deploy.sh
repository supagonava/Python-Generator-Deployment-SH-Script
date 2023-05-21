# Copy config file
cp /var/wwwroot/%APP_NAME%/deployments/site.prod.conf /etc/nginx/sites-available/default
cp /var/wwwroot/%APP_NAME%/deployments/nginx.prod.conf /etc/nginx/nginx.conf
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled

# sudo rm /etc/supervisor/conf.d/supervisor.conf
sudo cp /var/wwwroot/%APP_NAME%/deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf

# Disable apache2
# sudo service apache2 stop && systemctl disable apache2

# Restart
sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/storage
sudo chown -R www-data:www-data /var/wwwroot/phpmyadmin
systemctl restart php8.1-fpm
sudo service supervisor restart && service nginx restart