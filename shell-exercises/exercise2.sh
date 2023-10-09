#!/bin/bash

echo -n "Please enter a number: "
read number

if [ $number -gt 10 ]
then
	echo "Girdiginiz sayi 10 dan buyuk";
elif [ $number -eq 10 ]
then
	echo "Girdiginiz sayi 10 a esit";
else
	echo "Girdiginiz sayi 10 dan kucuk";
fi
