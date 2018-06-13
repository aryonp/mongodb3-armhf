#!/bin/bash

FOLDER=mongodb3-bin

#create mongodb user
sudo adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos --no-create-home mongodb

#create temporary folder
sudo mkdir $FOLDER
sudo unzip *zip -d $FOLDER/
sudo chown -R root:root $FOLDER/
sudo chmod -R 0755 $FOLDER/
sudo cp -p $FOLDER/* /usr/bin

#create log file directory with appropriate owner & permissions
sudo mkdir /var/log/mongodb
sudo chown mongodb:nogroup /var/log/mongodb

#create the DB data directory with convenient access perms
sudo mkdir /var/lib/mongodb
sudo chown mongodb:root /var/lib/mongodb
sudo chmod 0775 /var/lib/mongodb

#move necessary files
sudo mv mongodb.conf /etc/mongodb.conf
sudo mv mongodb.service /lib/systemd/system/

#check service
sudo service mongodb start
sudo service mongodb status
