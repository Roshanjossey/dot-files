#!/bin/bash
while true
do
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
  if [[ "$battery_level" -ge 90   && `acpi -b | grep -o 'Charging'` == 'Charging' ]]; then
    dunstify -u critical -t 3000  "Battery Full" "Level: ${battery_level}%"
    paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
  elif [[ "$battery_level" -le 20  && `acpi -b | grep -o 'Discharging'` == 'Discharging' ]]; then
    dunstify -u critical -t 3000  "Battery Almost empty" "Level: ${battery_level}%"
    #paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
  fi
  sleep 3000
done
