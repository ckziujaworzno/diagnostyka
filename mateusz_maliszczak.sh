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
	ramczestotliwosc=$(dmidecode -t memory | grep -i speed | head -1  | awk '{print $2}')
	cram=$(dmidecode -t memory | grep -i speed | head -1  | awk '{print $3}')
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
	napedy=$(lspci | grep -i usb | head -n1 | cut -d: -f3 | cut -c-59)
	naped=$(dmesg | grep -i --color "cdrom" | cut -d: -f2)
	naped1=$(dmesg | grep -i --color "cdrom" | cut -d: -f3)
#Płyta główna
	plyta=$(dmidecode -t baseboard | grep -i manuf | cut -d: -f2)
	plyta1=$(dmidecode -t baseboard | grep -i prod | cut -d: -f2)
#Bios
	bios=$(dmidecode -t baseboard | grep -i manuf | cut -d: -f2)
	bios1=$(dmidecode -t baseboard | grep -i "BIOS rev" | cut -d: -f2)
#Chipset
	chipset=$(lspci | grep -i VGA | cut -d: -f3 | cut -c-25)
#Video
	video=$(lspci | grep -i VGA | cut -d: -f3 | cut -c-63)
#Audio
	audio=$(lspci | grep -i audio | cut -d: -f3 | cut -c-60)
#Karta sieciowa
	ethernet=$(lspci | egrep -i --color 'network|ethernet' | cut -d: -f3 | cut -c-55)
}

while :
do
info
clear
echo 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "" "" "Diagnostyka komputera" "$os"
echo
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Procesor" "-" "$cpu1 $cpu2 $cpu3 $cpu4 $rdzenie" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "$ramczestotliwosc $cram" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Pamięć RAM" "-" "całkowite-$ramt używane-$ramf wolne-$ramu" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Model dysku HDD" "-" "$hdd" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "całkowite-$hddfull %zajętego-$hddprocent" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "zajęte-$hddzajete"
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Dyski HDD" "-" "dostęþne-$hdddostepne"
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Inne napędy" "-" "$napedy $naped $naped1" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Płyta główna" "-" "$plyta $plyta1" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Bios" "-" "$bios $bios1" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Chipset" "-" "$chipset" ""
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Video" "-" "$video" ""
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Audio" "-" "$audio" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Karta sieciowa" "-" "$ethernet" "" 
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "" "" "" ""
printf "%-1s %-18s %-1s %-40s %-1s  %s\n" "" "Mateusz" "" "Maliszczak" ""
echo
done

