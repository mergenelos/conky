#!/usr/bin/env python

import os
import subprocess

getRunningConkys=subprocess.getoutput("pgrep conky")
runningConkys=getRunningConkys.rstrip().split('\n')

while '' in runningConkys:
	runningConkys.remove('')


if len(runningConkys)==0:
	pidofmargin=subprocess.getoutput('xfconf-query -c xfwm4 -p /general/margin_top -s 25')
	pidofconky=pidofconky=subprocess.getoutput('conky &')