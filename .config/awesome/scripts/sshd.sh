#!/bin/bash
# Small widget informing that the SSHD daemon is active.

activeColor='#F06060'

symbol=( $(echo -e "\u26B6") )

active=$(systemctl status sshd.service | grep 'Active: active')

if [[ -n "$active" ]]
then
  echo "<span foreground='$activeColor'>$symbol sshd</span>"
fi

