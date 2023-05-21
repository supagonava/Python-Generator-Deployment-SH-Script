# Copy config file
cd /var/wwwroot/%APP_NAME%
cp deployments/nginx.prod.conf /etc/nginx/sites-available/nginx.prod.conf
sudo rm /etc/supervisor/conf.d/supervisor.conf
sudo cp deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf
sudo unlink /etc/nginx/sites-enabled/nginx.prod.conf
sudo ln -s /etc/nginx/sites-available/nginx.prod.conf /etc/nginx/sites-enabled

# Disable apache2
sudo service apache2 stop && systemctl disable apache2

# Restart
sudo service supervisor restart && service nginx restart