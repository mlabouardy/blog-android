#!/bin/bash
WORDPRESS_DB_NAME='blog';
WORDPRESS_DB_USER='root';
WORDPRESS_DB_PASSWORD='root';
container=$(docker ps -q --filter="name=blog_db");
filename='backup.sql';
docker exec $container sh -c "exec mysql -u $WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME" < $filename
