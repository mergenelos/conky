#!/usr/bin/env python

import os
import subprocess

getRunningConkys=subprocess.getoutput("pgrep conky")
runningConkys=getRunningConkys.rstrip().split('\n')
desktop=subprocess.getoutput("xdotool get_desktop")
anyMaxWin=subprocess.getoutput("xdotool search --onlyvisible --desktop "+desktop+" --name ''")
anyMaxWin=anyMaxWin.split('\n')

yesExist=0
for i in anyMaxWin:
	i = subprocess.getoutput("xdotool getwindowgeometry "+i)
	i=i.rstrip().split('\n')
	i=i[2]
	i=i[17:]
	if int(i)>716 and int(i)<767:
		yesExist=1
		break

if len(runningConkys)==1 and yesExist==1:
	pidofconky=subprocess.getoutput('conky -c ~/.conkyrc_arch')