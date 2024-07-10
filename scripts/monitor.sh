#!/bin/sh
echo "Setting display resolution" >> /tmp/monitor.log
xrandr --output HDMI-0 --mode 1920x1080 --rate 165.00
echo "Done setting display resolution" >> /tmp/monitor.log

