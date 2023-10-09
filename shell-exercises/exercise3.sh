#!/bin/bash

Topla()
{
	sayi1=$1;
	sayi2=$2;
	((sonuc=sayi1+sayi2));
	return $sonuc;
}

Topla $1 $2;
echo $?;
