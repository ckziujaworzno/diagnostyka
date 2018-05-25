#!/bin/bash
#diagnosyka komputera
#Program wyśwela parametry wszyskich podzespołów
info()

{
#sprawdzamy pamięć ram
	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
	typramu=$(sudo dmidecode -t 17 |grep -i Type |head -2 |cut -c-11 |grep -i type | awk '{print $2}')
	ramczestotliwosc=$(sudo dmidecode -t memory |grep Speed |head -1 |cut -d : -f2)
	
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
	napedy=$(dmesg |grep cdrom |cut -d : -f2-3)
#Płyta główna
	plyta=$(sudo dmidecode -t baseboard |grep "Product Name" |cut -d : -f2)
#Bios
	bios=$(sudo dmidecode -t bios |grep -i ven |cut -d : -f2)
#Chipset
	chipset=$(tu wpisz polecenie)
#Video
	video=$(lspci |grep VGA |cut -d : -f3)
#Audio
	audio=$(lspci |grep "Audio device" |cut -d : -f3)
#Karta sieciowa
	ethernet=$(lspci |grep "Ethernet controller" |cut -d : -f3)
}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "$cpu1 $cpu2 $cpu3 $cpu4 $rdzenie " "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" " $typramu $ramczestotliwosc" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$ramu $ramf $ramt" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hdd  " "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "$hddfull $hddzajete $hdddostepne $hddprocent" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "$napedy" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "tutaj powinien być model" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Mateusz" "" "Żak" ""
echo
done

