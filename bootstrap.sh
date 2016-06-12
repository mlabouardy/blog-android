#!/bin/bash

CONTAINER='blog_db';
WORDPRESS_DB_NAME='blog';
WORDPRESS_DB_USER='root';
WORDPRESS_DB_PASSWORD='root';
SERVER_URL='https://github.com/mlabouardy/blog-android/archive';
LOG_FILE='bootstrap.log';

## Get themes & Plugins
echo 'Get Blog themes and plugins';
wget -q $SERVER_URL/archives.zip;
unzip archives.zip >> $LOG_FILE;
cp -r blog-android-archives/themes themes
cp -r blog-android-archives/plugins plugins
rm -rf archives.zip blog-android-archives

## Build environment
echo 'Create docker containers';
docker-compose up -d --force-recreate >> $LOG_FILE;

## Init database
echo 'Initialize database';
wget -q $SERVER_URL/backup.zip;
unzip backup.zip >> $LOG_FILE;
sleep 5
docker exec -i $CONTAINER mysql -u $WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME < blog-android-backup/backup.sql >> $LOG_FILE;
rm -rf backup.zip blog-android-backup

echo 'Enjoy :)';
