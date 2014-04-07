#!/bin/bash

NAME="NEW_TITLE"

echo "Opening browser.."

xdg-open http://www.lostfilm.tv  2>/dev/null &
sleep 5

echo  "Searching for button.."

res=$(sikuli OSI1.sikuli 2>/dev/null)

if [[ $res =~ error ]]; then
  echo "Sorry, can't find RED BUTTON."
  exit
fi

[[ $res =~ x=([0-9]+) ]]
x="${BASH_REMATCH[1]}"
[[ $res =~ y=([0-9]+) ]]
y="${BASH_REMATCH[1]}"

echo  "Scrining  before.."

scrot before.png

echo  "Clicking.."

xdotool mousemove --sync $x $y
xdotool mousemove_relative --sync 5 5
xdotool click 1

echo  "Scrining  after.."

sleep 1
scrot after.png