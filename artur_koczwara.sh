#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$()
	ramczestotliwosc=$()
	
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
	hddmodel=$(hdparm -i /dev/sda |grep -i model)
#Inne napędy
	napedy=$( cat /var/log/dmesg | grep -i cd-rom|head -n 1 |cut -d: -f5)
#Płyta główna
	plyta=$(dmidecode -t baseboard |grep -e  Manufacturer|cut -d: -f2)
#Bios
	bios=$(tu wpisz polecenie)
#Chipset
	chipset=$(tu wpisz polecenie)
#Video
	video=$(dmidecode -t baseboard |grep -i description |cut -d: -f2|head -n 1)
#Audio
	audio=$(dmidecode -t baseboard |grep -i description |cut -d: -f2|head -n 2)
#Karta sieciowa
	ethernet=$(lshw -class network |grep -e product |cut -d: -f2)
	ethetnet2=$(dmidecode -t baseboard |grep -i description |cut -d: -f2|head -n|head -n 3)


}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "tutaj powinny być paramery CPU " "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "tutaj powinny być paramery,typ,częstotliość" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "tutaj powinno być wykorzystanie" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "tutaj powinien być model, paramery" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "tutaj powinno być wykorzystanie dysków" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "tutaj powinien być model" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "tutaj powinien być model" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "tutaj powinien być model" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "tutaj powinien być model" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "tutaj powinien być model" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "tutaj powinien być model" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "tutaj powinien być model" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Imię" "" "Nazwisko" ""
echo
done

