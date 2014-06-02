#!/bin/bash

healthy='#859900'
low='#B58900'
discharge='#DC322F'

capacity=( $(</sys/class/power_supply/BAT0/capacity) )
if (($capacity <= 25));
then
  capacityColor=$low
else
  capacityColor=$healthy
fi

status=( $(</sys/class/power_supply/BAT0/status) )
if [[ "$status" = "Discharging" ]]
then
  statusColor=$discharge
  status=( $(echo -e "\u2715") )
else
  statusColor=$healthy
  status=( $(echo -e "\u26A1") )
fi

echo "<span foreground='$statusColor'>$status</span> <span foreground='$capacityColor'>$capacity%</span>"

