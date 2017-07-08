#1/bin/bash

server=$( cat /opt/infrati/config/scripts.conf | grep ^server | awk '{ print $2 }' )
if [ -n "$1" ] ; then
	rm -rf $server/standalone/deployments/$1*
fi
rm -rf $server/standalone/log/server.log.*
rm $server/standalone/tmp/auth/*
rm -rf $server/standalone/tmp/auth/*
if [ -n "$1" ] ; then
	rm -rf $server/standalone/tmp/vfs/$1*
fi
rm -rf $server/standalone/tmp/vfs/deployment/*
rm -rf $server/standalone/tmp/vfs/temp/*
echo "" > $server/standalone/log/server.log
echo "" > $server/standalone/log/security-audit.log 
echo "" > /var/log/wildfly/console.log 

