#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z $DATABASE_HOST $DATABASE_PORT; do
    sleep 1
done

echo "PostgreSQL started"

python manage.py flush --no-input
python manage.py migrate

exec "$@"