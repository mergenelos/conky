#!/usr/bin/env python

import os
import subprocess

runningConkys=subprocess.getoutput("pgrep -n conky")


# currentWindow = subprocess.getoutput("xdotool getactivewindow getwindowgeometry")
# currentWindow=currentWindow.rstrip().split('\n')
# currentWindow=currentWindow[2]
# currentWindow=currentWindow[17:]
desktop=subprocess.getoutput("xdotool get_desktop")
anyMaxWin=subprocess.getoutput("xdotool search --onlyvisible --desktop "+desktop+" --name ''")
anyMaxWin=anyMaxWin.split('\n')

yesExist=0

for i in anyMaxWin:
	i = subprocess.getoutput("xdotool getwindowgeometry "+i)
	i=i.rstrip().split('\n')
	i=i[2]
	i=i[16:]
	if i=="x725" or i=="x743":
		yesExist=1
		break

if yesExist==0:
	subprocess.getoutput('kill '+ runningConkys)

