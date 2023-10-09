#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Error: The number of arguments must be equal to 1.";
elif [ ! -d $1 ]
then
	echo "Error: The input argument must be a directory.";
else
	maximumLength=-1;

	for i in `ls $1`
	do
		if [ -f "$i" ]
		then
			echo "$i";

			length=${#i};
			if [ $length -gt $maximumLength ]
			then
				maximumLength=$length;
				name="$i";
			fi
		fi
	done
	echo "Maximum length is $maximumLength";
	echo "The name of the file is $name";
fi
