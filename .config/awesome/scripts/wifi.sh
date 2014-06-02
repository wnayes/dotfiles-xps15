#!/bin/bash

none='#555555'
on='#6060F0'

symbol=( $(echo -e "\u21C5") )

active=$(netctl list | grep '*' | cut -d' ' -f 2)

if [[ -z "$active" ]]
then
  symbolColor=$none
  active="none"
  profileColor=$none
else
  symbolColor='#AAAAAA'
  profileColor=$on
fi

echo "<span foreground='$symbolColor'>$symbol</span> <span foreground='$profileColor'>$active</span>"

