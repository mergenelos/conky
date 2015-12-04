#!/usr/bin/env python

import os
import subprocess

musicUrl = subprocess.getoutput("playerctl metadata mpris:trackid")
colorFileUrl = open("/home/mak/.conky/MConky/playRingColorId.txt", "r+")
colorFile = open("/home/mak/.conky/MConky/playRingColor.txt", "r+")
color = colorFile.readline()
colorFile.close()

if colorFileUrl.readline()==musicUrl:
	colorFileUrl.close()
	colorFile.close()
else:
	colorFileUrl.close()
	colorFileUrl = open("/home/mak/.conky/MConky/playRingColorId.txt", "w")
	colorFileUrl.write(musicUrl)
	colorFileUrl.close()
	if color == 'pink':
		color='blue'
		colorFile = open("/home/mak/.conky/MConky/playRingColor.txt", "w")
		colorFile.write(color)
		colorFile.close()
	else:
		color='pink'
		colorFile = open("/home/mak/.conky/MConky/playRingColor.txt", "w")
		colorFile.write(color)
		colorFile.close()

print(color)