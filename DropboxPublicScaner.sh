#!/bin/bash
# Purpose: Scanning the publicly available Dropbox Public folder
# Author: Krzysztof Dziadziak <on Gmail>
# Last updated on : 01-May-2015
# -----------------------------------------------

TYPES=types.txt

if test ! -f "$TYPES" ; then   
	echo Error - $TYPES not found. This file should contain list of files to look for. See example below:
	echo
	echo me.jpg
	echo me.txt
	exit 1
fi

if [ $# -lt 2 ] ; then
	echo Usage "$0" START_DROPBOX_ID END_DROPBOX_ID
	echo
	echo "To see curentlly run downloading proceses		ps aux | grep dl.dropbox.com"
	echo "To kill all instancess of scaner			pkill -f NAME_OF_SCRIPT"
else
	if [ $# -eq 2 ] ; then
		types="`awk '!a[$0]++' $TYPES`"			# remove types duplications if any

		for type in $types ; do
			echo Background process for type "$type" started			
			sh `"$0" "$1" "$2" "$type"` &
		done
	else
		for (( i="$1"; i<="$2"; i++ )) ; do
			#get file in quiet mode, max tries only twice if smth goes wrong
			wget -q --tries=2 --timeout=30 --limit-rate=20k http://dl.dropbox.com/u/$i/"$3"
	
			if [ -f "$3" ] ; then
		  		mv $3 "$i"_"$3"
			fi
  		done
	fi
fi
