#!/bin/bash

none='#555555'
on='#6060F0'

symbol=( $(echo -e "\u21C5") )

active=$(netctl list | grep '*' | cut -d' ' -f 2)

# If netctl is not active, check if dhcpcd is.
if [[ -z "$active" ]]
then
  active=$(systemctl status dhcpcd@enp6s0 | grep 'Active: active (running)')
  if [[ -n "$active" ]]
  then
    active="dhcpcd"
  fi
fi

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

