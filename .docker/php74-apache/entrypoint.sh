#!/bin/bash

if [ -d /var/www/html ]
then
    echo "directory is not empty"
    cd /var/www/html
else
    echo "directory empty ... install project"
    cd /var/www/html
    composer create-project symfony/skeleton:"6.1.*" .
    composer require webapp
    chown -R www-data:1000 /var/www/html
fi
