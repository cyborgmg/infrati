#!/bin/bash

#data=$(date +"%m-%d-%Y.%H.%M.%S")
data=$(date +"%Y-%m-%d.%H.%M.%S")
tgz=/opt/wildfly/standalone/log/kraken-server-$data.tgz

tar cvfz $tgz /opt/wildfly/standalone/log/server.* /var/log/wildfly/console.log
echo "" > /var/log/wildfly/console.log
echo "" > /opt/wildfly/standalone/log/server.log
rm -rf /opt/wildfly/standalone/log/server.log.*
aws --profile pu-kraken s3 cp $tgz s3://pu-kraken-logs/
rm -rf /opt/wildfly/standalone/log/server*.tgz
