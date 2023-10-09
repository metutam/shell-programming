#/bin/bash

IfHarshad()
{
	total=0;

	number=$1;

	while [ $number -ne 0 ]
	do
		((total=total+number%10));
		((number/=10));
	done

	if(($1%total==0))
	then
		return 1;
	else
		return 0;
	fi
}

if [ $# -ne 1 ]
then
	echo "The Number of Command Line Argument Must Be 1.";
elif [ $1 -lt 0 ]
then
	echo "Command Line Argument Must Be Positive Number.";
else
	IfHarshad $1;

	if(($?==1))
	then
		echo "$1 is a Harshad Number.";
	else
		echo "$1 is not a Harshad Number.";
	fi
fi
