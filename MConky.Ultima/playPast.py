#!/usr/bin/env python

import os
import subprocess
import dbus

completetime = subprocess.getoutput("playerctl metadata mpris:length")
musicUrl = subprocess.getoutput("playerctl metadata mpris:trackid")
playState=subprocess.getoutput("playerctl status")

runningPlayer=subprocess.getoutput("playerctl -l")
runningPlayer=runningPlayer.rstrip().split('\n')

if playState=='Playing' or playState=='Paused':
	bus = dbus.SessionBus()
	proxy = bus.get_object('org.mpris.MediaPlayer2.'+runningPlayer[0],'/org/mpris/MediaPlayer2')
	player = dbus.Interface(proxy, 'org.mpris.MediaPlayer2.Player')
	playlists = dbus.Interface(proxy, 'org.mpris.MediaPlayer2.Playlists')
	tracklist = dbus.Interface(proxy, 'org.mpris.MediaPlayer2.TrackList')
	properties_manager = dbus.Interface(proxy, 'org.freedesktop.DBus.Properties')
	timePast= properties_manager.Get('org.mpris.MediaPlayer2.Player', 'Position')
else:
	timePast=1

print(timePast)