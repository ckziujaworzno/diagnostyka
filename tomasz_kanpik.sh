#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$(sudo dmidecode -t 17 |grep Type|awk '{print $2}'|head -n1)
	ramczestotliwosc=$()
	
#paramery procesora
	cpu1=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $1}')
	cpu2=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $2}')
	cpu3=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $4}')
	cpu4=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $7}')
	rdzenie=$(cat /proc/cpuinfo |grep "model name" | wc -l)
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
	usb=$(lspci |grep USB |head -n 1 |cut -d: -f3 |tr -d '#4')
#Płyta główna
	plyta=$(sudo dmidecode -t baseboard |grep 'Product Name:' |awk '{print $3}')
#Bios
	bios=$(sudo dmidecode -t bios |grep Version: |awk '{print $2}')
#Chipset
	chipset=$(lspci -v | grep -i vga |cut -d: -f3 |cut -c-72)
#Video
	video=$(sudo dmidecode -t baseboard |grep Description: |head -n1 |cut -d: -f2)
#Audio
	audio=$(sudo dmidecode -t baseboard |grep Description: |tail -n1 |cut -d: -f2)
#Karta sieciowa
	ethernet=$(ifconfig |cut -c-10 |tr -d ' '|tr -s '\n')
	ilekart=$(lspci |grep Ethernet | wc -l)
}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Procesor - producent" "-" "$cpu1" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Procesor - model" "-" "$cpu2" "" 
printf "%-1s %-47s %-1s %-40s %-1s  %s\n" "" "Procesor - ilość rdzeni" "-" "$rdzenie" "" 
printf "%-1s %-48s %-1s %-40s %-1s  %s\n" "" "Procesor - częstotliwość" "-" "$cpu4" "" 
printf "%-1s %-47s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM - typ" "-" "$typramu" ""
printf "%-1s %-50s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM - całkowita ilość (MB)" "-" "$ramt" "" 
printf "%-1s %-49s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM - wolna ilość (MB)" "-" "$ramf" "" 
printf "%-1s %-50s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM - używana ilość (MB)" "-" "$ramu" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Dyski HDD - nazwa" "-" "$hddname" "" 
printf "%-1s %-47s %-1s %-40s %-1s  %s\n" "" "Dyski HDD - pojemność" "-" "$hddfull" "" 
printf "%-1s %-46s %-1s %-40s %-1s  %s\n" "" "Dyski HDD - zajęte" "-" "$hddzajete" "" 
printf "%-1s %-46s %-1s %-40s %-1s  %s\n" "" "Dyski HDD - dostępne" "-" "$hdddostepne" "" 
printf "%-1s %-46s %-1s %-40s %-1s  %s\n" "" "Inne napędy - USB" "-" "$usb" "" 
printf "%-1s %-48s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" ""
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-47s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa - ilość" "-" "$ilekart" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa - nazwa" "-" "$ethernet" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "System" "-" "$os" "" 
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-45s %-1s %-40s %-1s  %s\n" "" "Tomasz" "" "Knapik" ""
echo
done

