#/bin/bash

if [ $# -ne 1 ]
then
	echo "The Number of Command Line Argument Must Be 1.";
elif [ ! -d $1 ]
then
	echo "Command Line Argument Must Be a Directory.";
else
	fileCounter=0;
	directoryCounter=0;

	#for i in $1/*
	for i in `ls $1`
	do
		#if [ -f $i ]
		if [ -f $1/$i ]
		then
			echo "$i is a file.";
			((fileCounter++));
		#elif [ -d $i ]
		elif [ -d $1/$i ]
		then
			echo "$i is a directory.";
			((directoryCounter++));
		fi
	done
	echo "The Number of Files is $fileCounter.";
	echo "The Number of Directories is $directoryCounter.";
fi
