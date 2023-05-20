sudo apt-get update
sudo apt-get install -y pkg-config libcairo2-dev libgirepository1.0-dev
sudo apt-get install python3-pip python3-dev libpq-dev nginx curl
sudo apt install certbot python3-certbot-nginx

# goto dir
pip3 install virtualenv
virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt

# Test server
python3 manage.py initial-data
python3 manage.py generate-deployment-conf
python3 manage.py migrate

gunicorn --bind 0.0.0.0:8000 config.wsgi


# Config NGINX
cp deployments/nginx.prod.conf /etc/nginx/sites-available/nginx.prod.conf
sudo ln -s /etc/nginx/sites-available/nginx.prod.conf /etc/nginx/sites-enabled

# Install Supervisor
sudo apt-get install supervisor
sudo rm /etc/supervisor/conf.d/supervisor.conf
sudo cp deployments/supervisor.prod.conf /etc/supervisor/conf.d/supervisor.conf

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start app_name

# Reload code after deploy
sudo nginx -t && systemctl restart nginx && supervisorctl restart app_name
