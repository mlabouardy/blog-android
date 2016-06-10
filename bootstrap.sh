#!/bin/bash

## Get themes & Plugins
echo "Get Blog themes and plugins";
wget https://github.com/mlabouardy/blog-android/archive/archives.zip
unzip archives.zip
cp -r blog-android-archives/themes themes
cp -r blog-android-archives/plugins plugins
rm -rf archives.zip blog-android-archives

## Build environment
echo "Create docker containers";
docker-compose up -d --force-recreate

## Init database
