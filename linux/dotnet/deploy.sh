cp /var/wwwroot/%APP_NAME%/deployments/site.prod.conf /etc/nginx/sites-available/%APP_NAME%.conf

sudo unlink /etc/nginx/sites-enabled/%APP_NAME%.conf
sudo ln -s /etc/nginx/sites-available/%APP_NAME%.conf /etc/nginx/sites-enabled
sudo cp /var/wwwroot/%APP_NAME%/deployments/supervisor.prod.conf /etc/supervisor/conf.d/%APP_NAME%.conf

sudo chown -R www-data:www-data /var/wwwroot/%APP_NAME%/
sudo service supervisor restart && service nginx restart
sudo supervisorctl status
