#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlan0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 20`

case $bars in
  0) bar='[-----]' ;;
  1) bar='[+----]' ;;
  2) bar='[++---]' ;;
  3) bar='[+++--]' ;;
  4) bar='[++++-]' ;;
  5) bar='[+++++]' ;;
  *) bar='[--!--]' ;;
esac

echo $essid $bar
exit 0
