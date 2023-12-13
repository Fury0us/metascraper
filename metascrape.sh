#!/bin/bash
if [ /usr/bin/figlet ]
then
echo $'\e[36mfiglet is installed\e[0m'
else
sudo apt install figlet &&
clear &&
echo $'\e[36mfiglet has been installed, script can continue.\e[0m'
fi
if [ /usr/bin/exiftool ]
then
echo $'\e[36mexiftool is installed\e[0m'
else
sudo apt install exiftool
clear
echo $'\e[36mexiftool has been installed, script can continue\e[0m'
sleep 1
fi
echo $'\e[1;36m'
figlet Metascraper
echo $'\e[0m'
main_menu() {
COLUMNS=12
echo $'\e[1;36m'
PS3=("#main: ")
aa=("Read Data" "Write Data" "Exit")
select a in "${aa[@]}"; do
case $a in
"Read Data")
echo -en '\n'
readmon
echo -en '\n'
;;
"Write Data")
echo -en '\n'
writemon
echo -en '\n'
;;
"Exit")
echo $'\e[1;31mExiting...\e[0m'
echo -en '\n'
exit
;;
esac
done
}
readmon() {
COLUMNS=12
PS3=("#readmon: ")
ab=("Common" "All" "Unknown" "Embedded" "Main")
echo -en '\n'
echo "----------------------------"
echo "Please Include Path W/ Photo"
echo "----------------------------"
echo -en '\n'
select a in "${ab[@]}"; do
case $a in
"Common")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool $pt
echo -en '\n'
;;
"All")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -e $pt
echo -en '\n'
;;
"Unknown")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -u $pt
echo -en '\n'
;;
"Embedded")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -U $pt
echo -en '\n'
;;
"Main")
echo -en '\n'
main_menu
;;
esac
done
}
writemon() {
COLUMNS=12
PS3=("#writemon: ")
ac=("Delete All" "Write New" "Existing" "Main")
echo -en '\n'
echo "----------------------------"
echo "Please Include Path W/ Photo"
echo "----------------------------"
echo -en '\n'
select a in "${ac[@]}"; do
case $a in
"Delete All")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -All= $pt
echo -en '\n'
;;
"Write New")
read -p $'\e[1;31mDataTag?: \e[0m' t
read -p $'\e[1;31mValue?: \e[0m' v
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -$t=$v $pt
echo -en '\n'
;;
"Existing")
read -p $'\e[1;31mPhoto?: \e[0m' pt
echo -en '\n'
sudo exiftool -e $pt
echo -en '\n'
;;
"Main")
echo -en '\n'
main_menu
;;
esac
done
}
main_menu
