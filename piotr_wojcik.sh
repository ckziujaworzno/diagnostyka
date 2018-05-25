#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$(sudo dmidecode -t 17 | grep -i Type | head -2 | cut -c-11 | grep -i type | awk '{print $2}')
	ramczestotliwosc=$(sudo dmidecode -t 17 | grep -i speed | head -n1 | cut -d: f2)
	
#paramery procesora
	cpu1=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $1}')
	cpu2=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $2}')
	cpu3=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $4}')
	cpu4=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $6}')
	rdzenie=$( cat /proc/cpuinfo |grep "model name" | wc -l)
#nazwy dysków	
	hdd=$(df -H | grep ^/dev/ |cut -f3 -d '/'|awk '{print $1}')
#wersja sysemu
	os=$(uname)
#wykorzystanie dysków
	hddname=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $1 }')
	hddfull=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $2 }')
	hddzajete=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $3 }')
	hdddostepne=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $4 }')
	hddprocent=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $5 }')
#Inne napędy
	usb=$(lspci | grep -i usb | head -n1 | cut -d: -f3 | cut -c-59)
        cdrom=$(dmesg | egrep -i --color  "cdrom" | cut -d: -f2)
        cdrom1=$(dmesg | egrep -i --color  "cdrom" | cut -d: -f3)
#Płyta główna
	plyta=$(sudo dmidecode -t baseboard | grep -i manuf| cut -f 2 -d:)
        plyta1=$(sudo dmidecode -t baseboard | grep -i prod| cut -f 2 -d:)
#Bios
	bios=$(dmidecode -t bios | grep -i ven | cut -f 2 -d:)
        bios1=$(dmidecode -t bios | grep -i ver | cut -f 2 -d:)
#Chipset
	chipset=$(lspci |grep -i VGA | head -n1 | cut -f 2 -d:| cut -c-25)
#Video
	video=$(lspci | grep -i VGA | cut -d: -f3 | cut -c-63)
#Audio
	audio=$(lspci | grep -i audio | cut -d: -f3 | cut -c-60)
#Karta sieciowa
	ethernet=$(lspci | egrep -i --color "network|ethernet" | cut -d: -f3 | cut -c-50)
}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "rdzenie >$rdzenie | model > $cpu1 $cpu2 " "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$typramu $ramczestotliwosc" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "Calkowita > $ $ramt | Zajeta > $ramu | Wolna > $ramf" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "model > $hdd1 | nazwa > $hddname" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "Calkowite > $hddfull | Dostepne > $hdddostepne | Zajete > $hddzajete | Procent > $hddprocent" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "CD-ROM > $cdrom $cdrom1 | USB > $usb" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta $plyta1" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios $bios1" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Piotr" "" "Wójcik" ""
echo
done

