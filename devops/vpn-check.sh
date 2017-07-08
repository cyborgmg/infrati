#!/bin/bash

while [ 1 ]; do

	ping -c3 $1 > pingreport
	result=`grep "0 received" pingreport`
	truncresult="`echo "$result" | sed 's/^\(.................................\).*$/\1/'`"
	if [[ $truncresult == "3 packets transmitted, 0 received" ]]; then
		/usr/bin/vpn-cyborg-pptp
	fi
sleep 5
done
