#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1 |awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$(dmidecode --type 17|grep Type: | cut -f 2 -d: | tr -d "\n\r")
	ramczestotliwosc=$(dmidecode --type 17 |grep Speed: |cut -f 2 -d: | tr -d "\n\r")
	
#paramery procesora
	cpu1=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d: |awk '{print $1}')
	cpu2=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d: |awk '{print $2}')
	cpu3=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d: |awk '{print $4}')
	cpu4=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d: |awk '{print $6}')
	rdzenie=$( cat /proc/cpuinfo |grep "model name" | wc -l)
#nazwy dysków	
	hdd=$(df -H | grep ^/dev/ |cut -f3 -d '/'|awk '{print $1}')
#wersja sysemu
	os=$(uname)
#wykorzystanie dysków
	hddname=$(df -H | grep ^/dev/ |cut -f3 -d '/' | awk '{ print $1 }')
	hddfull=$(df -H | grep ^/dev/ |cut -f3 -d '/' | awk '{ print $2 }')
	hddzajete=$(df -H | grep ^/dev/ |cut -f3 -d '/' | awk '{ print $3 }')
	hdddostepne=$(df -H | grep ^/dev/ |cut -f3 -d '/' | awk '{ print $4 }')
	hddprocent=$(df -H | grep ^/dev/ |cut -f3 -d '/' | awk '{ print $5 }')
#Inne napędy
	napedy=$(dmesg |grep cdrom | cut -f 2,3 -d:)
#Płyta główna
	plyta=$(dmidecode -t baseboard | head -n 9 | tail -n 4 | cut -f 2 -d: | tr -d "\n\r")
#Bios
	bios=$(dmidecode -t bios | head -n 8 | tail -n 3 | cut -f 2 -d: | tr -d "\n\r")
	rev=$(dmidecode -t bios | tail -n 9 | head -n 1 | cut -f 2 -d:)
#Chipset
#	chipset=$(lspci -v | grep -i chipset | cut -f 3 -d:)
#Video
	video=$(lspci | grep -i vga | cut -f 3 -d:)
#Audio
	audio=$(lspci | grep -i audio | cut -f 3 -d:)
#Karta sieciowa
 	ethernet=$(lspci |grep -i ethernet | cut -f 3 -d:)
}

info


echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "$cpu1 $cpu2 $cpu3 $cpu4 $rdzenie" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$typramu $ramczestotliwosc" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$ramt $ramf $ramu" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hdd" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hddname $hddfull $hddzajete $hdddostepne $hddprocent" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "$napedy" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios $rev" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dominik" "" "Jałowiecki" ""
echo


