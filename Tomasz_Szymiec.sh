#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$(dmidecode -t 17 | grep -i Type | head -2| cut -c-11 | grep -i type| awk '{print $2}')
	ramczestotliwosc=$(dmidecode -t 17 | grep -i speed | head -n1| cut -d: -f2)
	
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
	napedy=$(cat /var/log/dmesg |grep CD)
#Płyta główna
	plyta=$(dmidecode -t baseboard | grep -i manuf| cut -d: -f2)
	plyta1=$(dmidecode -t baseboard | grep -i prod| cut -d: -f2)
#Bios
	bios=$(dmidecode -t bios | grep -i ven | cut -d: -f2)
	bios1=$(dmidecode -t bios | grep -i "BIOS rev" | cut -d: -f2)
#Chipset
	chipset=$(lspci -v |grep -i vga |cut -d: -f2)
#Video
	video=$(dmidecode |grep Media |cut -d: -f2)
#Audio
	audio=$(dmidecode |grep Audio |tail -n 1)
#Karta sieciowa
	ethernet=$(lspci |grep VGA  |cut -c 36-78)
}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "$cpu1" "$cpu2" "$cpu3" "$cpu4" "$rdzenie"
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$ramt" "$ramf" "$ramu"
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$typramu" "$ramczestotliwosc" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hdd" "$hddname"
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hddzjente" "$hddfull" "$hdddostepne" "$hddprocent"  
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "$napedy" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta1" "$plyta2" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios1" "$bios2" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Tomasz" "" "Szymiec" ""
echo
done

