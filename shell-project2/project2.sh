#!/bin/bash

Palindrom()
{
	letterNumber=${#word[0]};
	halfOfNumber=$(($letterNumber/2));
	
	if [ $letterNumber -le 1 ] #string must include at least 2 character
	then
		return 0;
	fi
	
	for((i=0;i<=$halfOfNumber;i++)) #compare two sided characters according to middle of string
	do
		if [ ${word[@]:$i:1} != ${word[@]:$(( ($letterNumber-1) - $i )):1} ]
		then
			return 0;
		fi
	done
	
	return 1;
}

Izogram()
{
	letterNumber=${#word[0]};
	
	if [ $letterNumber -le 1 ] #string must include at least 2 character
	then
		return 0;
	fi
	
	for((i=0;i<$letterNumber;i++)) #compare the first character with others and then compare the second character with others until last character
	do
		for((j=$i+1;j<$letterNumber;j++))
		do
			if [ ${word[@]:$i:1} = ${word[@]:$j:1} ]
			then
				return 0;
			fi
		done
	done
	
	return 1;
}

if [ $# -ne 1 ] #check whether the number of arguments is 1
then
	echo "Please enter 1 argument.";
elif [ ! -f $1 ] #check whether the file path is available
then
	echo "The first argument must be available.";
else
	palindromArray=();
	palindromMax=0;
	
	izogramArray=();
	izogramMax=0;
	
	while read line
	do
		IFS=$' ,.!;[]-“”'; #words separated by space , . ! ; [ ] - “ ”
		for word in ${line[@]}
		do
			if [[ $word =~ ^[A-Za-z0-9]+.*[A-Za-z0-9]+$ ]] #check whether the word starts with letter or number and ends with letter or number
			then
				Palindrom $word; #check whether the word is a palindrom
				if [ $? -eq 1 ]
				then
					palindromArray+=($word);
					
					if [ ${#word[0]} -ge $palindromMax ] #find the longest palindrom
					then
						palindromMax=${#word[0]};
						palindromWord=${word[0]};
					fi	
				fi
				
				Izogram $word; #check whether the word is an izogram
				if [ $? -eq 1 ]
				then
					izogramArray+=($word);
					
					
					if [ ${#word[0]} -gt $izogramMax ] #find the longest izogram
					then
						izogramMax=${#word[0]};
						izogramWord=${word[0]};
					fi
				fi
			fi			
		done
	done < $1
	
	echo "The longest palindrom word is: $palindromWord";
	echo "The longest izogram word is: $izogramWord";
	echo "";
	echo "There are `wc -w < "$1"` words.";
	echo "There are ${#palindromArray[@]} palindrom words.";
	echo "There are ${#izogramArray[@]} palindrom words.";
	
fi
