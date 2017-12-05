#!/usr/bin/env python

import os
import subprocess

completetime = subprocess.getoutput("playerctl metadata mpris:length")
musicUrl = subprocess.getoutput("playerctl metadata xesam:url")

if completetime==' ' or completetime=='' or completetime=="Connection to player failed: No players found":
	completetime=1000000
else:
	completetime = int(completetime)


print(completetime)