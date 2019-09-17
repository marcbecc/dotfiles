#!/usr/bin/env bash

# Terminate any already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# Launch polybar, using default config location ~/.config/polybar/config
# polybar example &
polybar PolybarBot &

echo "polybar launched..."
