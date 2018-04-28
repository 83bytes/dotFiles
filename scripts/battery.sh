#!/bin/bash

# need to add some stuff so that cron can run this shit
SHELL=/bin/bash
PATH=/usr/lib/ccache/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# gets the status and percentage
function get_info {
	var=$( acpi --battery )
	stat=$( echo "$var" | awk '{ print substr($3, 1, length($3) - 1) }' )
	percentag=$( echo "$var" | awk '{ print substr($4, 1, length($4) -2) }' )
}

# alerts the user with the given alert
function alert {
	notify-send -u critical "$1" "$2"
}

# does all logicy stuff
# basically alerts if its charging and 100%
# and alerts if its discharging and < 20%
# if its discharging and less than 10% it suspends it

function logic {

	# first argument is status (charging/discharing)
	# second one is percentage

	if [[ "$1" == "Discharging" && $2 -le 10 ]]
	then
		alert "*** YOU MORON ***" "battery level is very low you !! system will SUSPEND NOW (in 5 secs)."
		sleep 5s
		i3lock -fc 000000
		systemctl suspend 
	elif [[ "$1" == "Discharging"  &&  $2 -lt 25 ]]
	then
		alert "*** CRITICAL ALERT ***" "BATTERY LEVEL LOWER THAN 25%"
	elif [[ $1 == "Charging" && $2 -eq 98 ]]
	then
		alert "*** not-an-ALERT ***" "battery ALMOST fully CHARGED"
	fi
}


get_info
logic "$stat" "$percentag"

