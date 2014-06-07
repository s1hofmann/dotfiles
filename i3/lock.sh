#!/bin/bash
scrot /tmp/l.png
mogrify  -scale 10% -scale 1000% /tmp/l.png  # pixelated
convert -background Red -fill gray -gravity center -size `identify -format %w /tmp/l.png`x30 caption:"System locked" /tmp/l.png +swap -composite /tmp/l.modified.png
i3lock -i /tmp/l.modified.png
