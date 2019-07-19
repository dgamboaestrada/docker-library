#!/bin/bash
python manage.py migrate
yarn install --modules-folder assets/node_modules
python manage.py collectstatic --noinput
python manage.py runserver
