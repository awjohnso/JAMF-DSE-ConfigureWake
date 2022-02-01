#!/bin/zsh

# Author: Andrew W. Johnson
# Date: 2020.08.06
# Version 1.00
# Organization: Stony Brook Univeristy/DoIT

# This Jamf script will set the start up or wake time of a computer.
# We find that profiles sometimes don't always work and this to be more reliable.

# The script takes two arguments: first one is the day/s of the week, and the second one
# is the time. They both have to be in the following formats:
#
# M = Monday
# T = Tuesday
# W = Wednesday
# R = Thursday
# F = Friday
# S = Saturday
# U = Sunday
#
# Example: MTWRFSU, MT, MWF.
#
# Time is in 24h hh:mm:ss leading zeros for less then 10. Examples:
#
# 4:00 AM = 04:00:00
# 1:00 PM = 13:00:00

	# Check to see if the fourth variable is set, if not exit and warn user.
if [[ -v 4 ]]; then
	/bin/echo "Day of the week selected: ${4}."
	/bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: Day of the week selected: ${4}." >> /var/log/jamf.log
else
	/bin/echo "Day of the week is not set. Please fix."
	/bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: Day of the week is not set. Please fix." >> /var/log/jamf.log
	exit 1
fi

	# Check to see if the fifth variable is set, if not exit and warn user.
if [[ -v 5 ]]; then
	/bin/echo "Time selected is ${5}."
	/bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: Time selected is ${5}." >> /var/log/jamf.log
else
	/bin/echo "Wakup or start tine is not set. Please fix."
	/bin/echo "$( /bin/date | /usr/bin/awk '{print $1, $2, $3, $4}' ) $( /usr/sbin/scutil --get LocalHostName ) $( /usr/bin/basename ${0} )[$$]: Wakup or start tine is not set. Please fix." >> /var/log/jamf.log
	exit 1
fi

	# Set the wake or power on time and date.
/usr/bin/pmset repeat wakeorpoweron ${4} ${5}

	# Print out the results though the format is not straight forward.
/usr/bin/defaults read /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist

exit 0
