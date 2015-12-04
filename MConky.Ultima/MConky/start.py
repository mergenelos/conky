#!/usr/bin/env python

import os
import subprocess

getRunningConkys=subprocess.getoutput("pgrep conky")
runningConkys=getRunningConkys.rstrip().split('\n')

while '' in runningConkys:
	runningConkys.remove('')


if len(runningConkys)==0:
	pidofconky=subprocess.getoutput('conky -c ~/.conkyrc.conf &')


