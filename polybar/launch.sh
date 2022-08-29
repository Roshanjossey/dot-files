#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/toit.log
polybar toit 2>&1 | tee -a /tmp/toit.log & disown

echo "Bars launched..."
