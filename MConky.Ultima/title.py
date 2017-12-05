#!/usr/bin/env python


import os
import subprocess
title = subprocess.getoutput("playerctl metadata title")
musicUrl = subprocess.getoutput("playerctl metadata xesam:url")



if title=='' and musicUrl!='':
	title="noTitleEnt"
elif title=="Connection to player failed: No players found":
	title=""
print(title);