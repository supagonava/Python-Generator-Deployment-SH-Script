python manage.py initial-data -f &\
gunicorn config.wsgi:application --bind unix:app.sock