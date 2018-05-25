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
#Inne napędy
	napedy=$(dmesg |grep -i cdrom |cut -d: -f2)
#Płyta główna
	plyta=$(sudo dmidecode -t baseboard |head -6 |tail -1 |cut -d: -f2)
        plyta2=$(sudo dmidecode -t baseboard |head -7 |tail -1 |cut -d: -f2)
#Bios
	bios=$(sudo dmidecode -t bios |head -6 |tail -1 |cut -d: -f2)
        bios2=$(sudo dmidecode -t bios |head -7 |tail -1 |cut -d: -f2)
#Chipset
	chipset=$(lspci |grep -i vga |cut -c 36-61)
#Video
	video=$(lspci |grep VGA |cut -c 36-100)
#Audio
	audio=$(lspci |grep Audio |cut -c 23-85)
#Karta sieciowa
	ethernet=$(lspci |grep Ethernet |cut -c 30-83)
}

while :
do
info
clear
echo 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" ""
echo
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "$cpu1 $cpu2 $cpu3 $cpu4" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "  -" "tutaj powinny być paramery,typ,częstotliość" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "  -" "Calkowita: $ramt Wolna: $ramf Zajeta: $ramu" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "Nazwa: $hdd" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "Calkowita: $hddfull Zajeta: $hddzajete Dostepna: $hdddostepne Procentowe: $hddprocent" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Inne napędy" " -" "$napedy" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "   -" "$plyta $plyta2" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios $bios2" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" "" 
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Bartosz" "" "Kapciak" ""
echo
done

