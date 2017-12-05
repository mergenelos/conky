#!/usr/bin/env python


import os
import subprocess
artist = subprocess.getoutput("playerctl metadata artist")
musicUrl = subprocess.getoutput("playerctl metadata xesam:url")



if artist=='' and musicUrl!='':
	artist="noArtistEnt"
elif "failed" in artist:
	artist=""
if len(artist)>20:
	artist=artist[:20]+"..."


print('{:^22}'.format(artist));
