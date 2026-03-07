#!/bin/sh

while true; do
	sleep 30

	ubus -t 5 call dawn get_network 2>/dev/null
	[ $? == 7 ] || continue
	
	logger -t dawn-watchdog -p daemon.err "dawn deadlocked- force restart"
	/etc/init.d/dawn restart
	exit 0
done
