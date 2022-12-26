#!/bin/bash

echo "Apply database migrations"
python manage.py migrate


echo "Collect static files"
python manage.py collectstatic --noinput

echo "Adding redoc file"
cp redoc.yaml /app/static/redoc.yaml

exec "$@"