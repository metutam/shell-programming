#!/bin/bash

echo "İslemler Menusu";
echo "1-Ekrani Temizle";
echo "2-Ev Dizinini Detayli Listele";
echo "3-Yönetici Girişi Yap";

echo -n "Secenek Giriniz: ";
read secenek;
case $secenek in
	1)
		clear;
	;;
	2)
		ls -l ~;
	;;
	3)
		sudo su-;
	;;
	*)
		echo "Gecersiz Secim";
esac
