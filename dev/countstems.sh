#!/bin/bash

LEXC=../apertium-kum.kum.lexc

allcounts=`hfst-lexc --format foma $LEXC -o /dev/null 2>&1 | grep Root | sed -E 's/,/\n/g'`

for line in $allcounts; do
	thing=`echo $line | sed -E 's/(.*)\.\.\.([0-9]*),?/\1/'`;
	numbr=`echo $line | sed -E 's/(.*)\.\.\.([0-9]*),?/\2/'`;
	if [[ "$thing" == "Root" ]]; then
		rootsize=$numbr;
		root=`grep -A$rootsize Root $LEXC | grep -v Root`;
	fi;
done;

root=`echo $root | sed -E 's/\s*;/\n/g'`;

string=""
for line in $allcounts; do
	thing=`echo $line | sed -E 's/(.*)\.\.\.([0-9]*),?/\1/'`;
	numbr=`echo $line | sed -E 's/(.*)\.\.\.([0-9]*),?/\2/'`;
	for thingname in $root; do
		if [ "$thing" = "$thingname" ]; then
			string="$string + $numbr";
		fi;
	done;
done;

echo $string
echo `calc $string`;
