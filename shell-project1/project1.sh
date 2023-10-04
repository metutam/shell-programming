#!/bin/bash

#My script splits the file to equal parts. First of all, my script finds total number of lines of the first argument. Then this number is divided by the number of file.
#If there is remainder part from this division, the created new file take extra 1 line until it is divided without remainder.
#For instance, a file includes 100 lines and the script splits it to 6 files. Each file include 17 17 17 17 16 16 lines.
#For instance, a file includes 101 lines and the script splits it to 6 files. Each file include 17 17 17 17 17 16 lines.
#For instance, a file includes 102 lines and the script splits it to 6 files. Each file include 17 17 17 17 17 17 lines.

if [ $# -ne 2 ] #check whether the number of arguments is 2
then
	echo "Please enter 2 arguments.";
elif [ ! -f $1 ] #check whether the file path is a valid file path
then
	echo "The first argument must be a valid file path.";
elif [[ $2 =~ ^[+-]?[0-9]+[.][0-9]+$ ]] || [ $2 -le 0 ] #check whether the number of files is a positive integer
then
	echo "The second argument must be a positive integer.";
elif [ $2 -gt `wc -l < $1` ] #check whether the number of files is greater than the number of total lines of the first argument
then
	echo "The second argument must be less than the line number of the first argument.";
else
	divisor=$2; #assign the number of files to divisor variable
	eachFile=0; #initialize that created new files includes how many lines
	lineNumber=`wc -l < $1`; #calculate the number of total lines of the first argument
	
	firstPart=`echo $1 | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}'` #name of the file without extension
	secondPart=`echo $1 | awk -F '/' '{print $NF}' | awk -F '.' '{print $2}'` #extension name of the file
	
	for((i=1;i<=$2;i++))
	do
		if [ $(( lineNumber % divisor )) -ne 0 ] #check whether the number of total lines of the first argument can be divided by number of files without remaining
		then
			touch $firstPart-$i.$secondPart; #create a new file
		
			(( eachFile =  eachFile + ((lineNumber / divisor) + 1) )); #update that created new file by including how many lines
			head -n $(($eachFile)) $1 | tail -n $(( (lineNumber / divisor) + 1 )) | cat > $firstPart-$i.$secondPart; #select interested lines and overwrite it
		
			(( lineNumber = lineNumber - ((lineNumber / divisor) + 1) )); #update the number of total lines of the first argument
			(( divisor = divisor - 1 )); #update the number of files
		else
			touch $firstPart-$i.$secondPart; #create a new file
		
			(( eachFile =  eachFile + (lineNumber / divisor) )); #update that created new file by including how many lines
			head -n $(($eachFile)) $1 | tail -n $(( (lineNumber / divisor) )) | cat > $firstPart-$i.$secondPart; #select interested lines and overwrite it
		
			(( lineNumber = lineNumber - (lineNumber / divisor) )); #update the number of total lines of the first argument
			(( divisor = divisor - 1 )); #update the number of files
		fi
	done
fi
