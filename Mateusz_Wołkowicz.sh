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
echo $typramu
echo $ramczestsotliwosc

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
	napedy=$(tu wpisz polecenie)
#Płyta główna
	plyta=$(dmidecode -t baseboard | grep -i manuf| cut -d: -f2)
	plyta1=$(dmidecode -t baseboard | grep -i prod| cut -d: -f2)
echo $plyta
echo $plyta1
#Bios
	bios=$(dmidecode -t bios | grep -i ven | cut -d: -f2)
	bios1=$(dmidecode -t bios | grep -i "BIOS rev" | cut -d: -f2)
echo $bios
echo $bios1
#Chipset
	chipset=$(tu wpisz polecenie)
#Video
	video=$(tu wpisz polecenie)
#Audio
	audio=$(tu wpisz polecenie)
#Karta sieciowa
	ethernet=$(tu wpisz polecenie)
}

while :
do
info

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
printf "%-1s %-15s %-1s %-40s %-1s  %s\n" "" "Mateusz" "" "Wołkowicz" ""
echo
done

