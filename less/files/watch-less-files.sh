#!/bin/bash
# Detect changes in .less files and automatically compile into .css
if [ $# -eq 0 ]; then
	echo "Specify a main .less file"
	exit 1
fi
if [ $# -eq 1 ]; then
	echo "Specify a target .css file"
	exit 1
fi
if [ $# -eq 2 ]; then
	echo "Specify a directory to watch for changes"
	exit 1
fi
while true
do
	for f in $(find $3 -name '*.less'); do
		if [ "$f" -nt "$2" ]; then
			lessc $1 > $2 && echo "Compiled";
		fi
	done
	sleep 1
done
