#!/bin/bash
# minibck4
# Sichert und stellt wieder her, mit Browser, mit Funktionen
# Funktionen
# ==========
frage(){
local antwort
echo -e "$1 \c"
read antwort
if [ $antwort = "y" ]
then return 0
else return 1
fi
}
save(){
mkdir -p /archive/$PWD
if [ -d "$1" ]
then cp -r $1 /archive/$PWD
else cp $1 /archive/$PWD
fi
}
recover(){
cp /archive/$PWD/$1 .
}
browse(){
local file=$1
local PS3="Datei oder Directory waehlen: "
while true
do
echo
select file in quit ../ `ls -p`
do
[ "$file" = "quit" ] && break 2
echo "Datei: $file"
archfile=$file
echo
if [ -d $file ]
then
cd $file
break
fi
done
done

}
# Hauptprogramm
# =============
archfile=""
PS3="Bitte waehlen Sie eine Aktion: "
echo
select eingabe in browsen sichern wiederherstellen quit
do
case "$eingabe" in
sichern)
if frage "Datei $archfile sichern y/n?"
then save $archfile
fi
;;
wiederherstellen)
if [ ! -f $archfile ]
then
echo -e "Datei angeben: \c"
read archfile
fi
if frage "Datei $archfile wiederherstellen y/n?"
then recover $archfile
fi
;;
browsen)
browse $archfile
;;
quit)
break
;;
*)
echo "Eingabe falsch. Bitte eine Zahl waehlen."
;;
esac
echo
done
