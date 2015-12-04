#!/usr/bin/env python

import os
import subprocess


getCurrentPid = subprocess.getoutput("xdotool getactivewindow getwindowpid")
getstate=subprocess.getoutput('ps -p '+getCurrentPid+' -o %cpu,%mem')
state=getstate.rstrip().split('\n')
state=state[1].rstrip().split(' ')
while '' in state:
	state.remove('')
print('P '+getCurrentPid+' C '+state[0]+'% M '+state[1]+'%')
