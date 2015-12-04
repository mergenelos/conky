#!/usr/bin/env python


import os
import subprocess


imageurl = subprocess.getoutput("playerctl metadata mpris:artUrl")
imageurl = imageurl[7:]
musicId = subprocess.getoutput("playerctl metadata mpris:trackid")
preMusic = open("/home/mak/.conky/MConky/preMusic.txt", "r+")
preMusicId = preMusic.readline()
preMusicId = preMusicId.rstrip("\n")
preImageurl = preMusic.readline()
preImageurl = preImageurl.rstrip("\n")


if preMusicId==musicId and preImageurl==imageurl:
	preMusic.close()
	#nop
else:
	preMusic.close()
	preMusic = open("/home/mak/.conky/MConky/preMusic.txt", "w")
	preMusic.write(musicId+'\n'+imageurl)
	preMusic.close()

	dst="~/.conky/MConky/imageurl.jpg"
	unk="~/imageurl.jpg"
	circle_imageurl="~/.conky/MConky/circle_imageurl.png"
	if_playing="~/.conky/MConky/makonplay.png"
	mak="~/.conky/MConky/mak.png"

	if imageurl=='' or ("failed" in imageurl):
		os.system('rm ' + dst)
		os.system('rm ' + if_playing)
		#os.system('ln -sf ' + noartist + ' ' + dst)
		#os.system('rm ' + unk)
		imageurl=mak
	else:
		os.system('ln -sf '+mak+' '+if_playing)

	os.system('ln -sf ' + imageurl + ' ' + dst)
	os.system('convert '+imageurl+' -resize 500x500 '+circle_imageurl)
	os.system('convert -size 500x500 xc:none -fill '+circle_imageurl+' -draw "circle 250,250 250,1" '+circle_imageurl)




