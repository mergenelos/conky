conky.config = {

	background = false,
	update_interval = 1,
	cpu_avg_samples = 1,
	net_avg_samples = 2,
	double_buffer = true,

	draw_graph_borders = false,
	draw_outline = false,
	draw_shades = false,

	alignment = 'top_left',
	minimum_width = 1366,
	minimum_height = 600,
	gap_x = 0,
	gap_y = 0,

	use_xft = true,
	font = 'Aller:Bold:size=12',
	xftalpha = 0.5,

	default_color = '555',
	color1 = 'fff',
	color2 = '3daee9',
	color3 = 'FFFFFF',
	color4 = 'D9D9D9',
	color5 = '1793D1',

  	draw_borders = false,
 	own_window = true,
	own_window_type = 'desktop',
	own_window_transparent = true,
	own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',

	override_utf8_locale = tue,
	short_units = true,

	lua_load = '~/.config/conky/MConky/lua.lua',
}





conky.text = [[
${voffset 60}
${lua ring_stats}
${color1}${goto 348}${voffset 28}${font Ubuntu:style=Bold:size=10}CPU${font}
${goto 344}${voffset 1}${font Ubuntu:style=Bold:size=10}MEM${font}
${goto 341}${voffset -3}${font Ubuntu:style=Bold:size=10}SWAP${font}
${goto 357}${voffset -2}${font Ubuntu:style=Bold:size=10}UP${font}
${goto 338}${voffset -5}${font Ubuntu:style=Bold:size=10}DOWN${font}
${goto 341}${voffset 2}${font Ubuntu:style=Bold:size=10}ROOT${font}
${goto 340}${voffset -5}${font Ubuntu:style=Bold:size=10}HOME${font}
${goto 350}${voffset -6}${font Ubuntu:style=Bold:size=10}WIN${font}
${goto 343}${voffset -6}${font Ubuntu:style=Bold:size=10}DATA${font}
${goto 520}${voffset 256}${font Ubuntu:style=Bold:size=20}0${font}
${goto 500}${voffset -6}${font Ubuntu:style=Bold:size=20}1${font}
${goto 475}${voffset -5}${font Ubuntu:style=Bold:size=20}2${font}
${goto 450}${voffset -11}${font Ubuntu:style=Bold:size=20}3${font}
${goto 425}${voffset -16}${font Ubuntu:style=Bold:size=20}4${font}
${goto 397}${voffset -17}${font Ubuntu:style=Bold:size=20}5${font}
${goto 368}${voffset -22}${font Ubuntu:style=Bold:size=20}6${font}
${goto 339}${voffset -25}${font Ubuntu:style=Bold:size=20}7${font}
${goto 311}${voffset -29}${font Ubuntu:style=Bold:size=20}8${font}
${goto 288}${voffset -31}${font Ubuntu:style=Bold:size=20}9${font}
${goto 260}${voffset -36}${font Ubuntu:style=Bold:size=20}A${font}
${goto 237}${voffset -37}${font Ubuntu:style=Bold:size=20}B${font}
${goto 219}${voffset -37}${font Ubuntu:style=Bold:size=20}C${font}${color}


${goto 80}${voffset -380}${font Ubuntu:size=20}${color grey}$sysname${font} $kernel${font Ubuntu:size=10}
${goto 134}${color grey}on a $machine machine${font}
${goto 172}${voffset -5}${font Ubuntu:size=20}${color grey}$nodename${font}


${goto 575}${voffset -100}Uptime: $uptime
${goto 590}Battery at ${battery_percent BAT1}%


${goto 617}${voffset 0}CPUAV: ${cpu cpu0}%
${GOTO 625}Frequency: ${freq_g}Ghz
${GOTO 632}Load: $loadavg
${GOTO 637}Processes: $processes
${GOTO 640}Temp: ${if_match ${hwmon 1 temp 1}!=0}${hwmon 1 temp 1}${else}${hwmon 0 temp 1}${endif}°C
${goto 800}${voffset -505}${color #888888}${cpugraph 500, 100 00C9FF 00C9FF}

${goto 647}${voffset 0}RAM: ${memperc}%
${goto 648}Free: ${memeasyfree}
${goto 649}Used: ${mem}
${goto 648}SWAP: ${swapperc}%
${goto 647}Avail: ${swapmax}
${goto 644}Used: ${swap}
${goto 920}${voffset -175}${color grey}${font Ubuntu:size=20}${top name 1}${font}${color}
${goto 923}is using${top cpu 1}% CPU
${goto 925}and ${top mem_res 1} of RAM
${goto 928}${voffset 10}${top name 2} ${top cpu 2}%, ${top mem_res 2}
${goto 930}${top name 3} ${top cpu 3}%, ${top mem_res 3}
${goto 931}${top name 4} ${top cpu 4}%, ${top mem_res 4}
${goto 930}${top name 5} ${top cpu 5}%, ${top mem_res 5}
${goto 930}${top name 6} ${top cpu 6}%, ${top mem_res 6}

${goto 638}${voffset 40}Up: ${upspeed wlp8s0}
${goto 632}overall: ${totalup wlp8s0}
${goto 627}Down: ${downspeed wlp8s0}
${goto 619}overall: ${totaldown wlp8s0}
${goto 611}Signal: ${wireless_link_qual wlp8s0}%
${goto 770}${voffset -93}${color #888888}${upspeedgraph wlp8s0 50,100 00FF00 00FF00}
${goto 770}${voffset 10}${color #888888}${downspeedgraph wlp8s0 -50,100 1ba1e2 1ba1e2}

${goto 590}${voffset 5}RFree: ${fs_free /}
${goto 577}HFree: ${fs_free /home}

${color1}${goto 895}${voffset -450}${font Antipasto:pixelsize=75}${time %d}${font}
${goto 910}${voffset 0}${time  %B}
${goto 915}${voffset 0}${time %Y}
${goto 923}${voffset 0}${time %A}
${goto 927}${voffset 150}${font Antipasto:pixelsize=80}${time  %H}Hr${if_match ${time  %H}>1}s${endif}${font}
${goto 918}${voffset -20}${font Antipasto:pixelsize=80}${time  %M}Min${if_match ${time  %M}>1}s${endif}${font}
${goto 903}${voffset -20}${font Antipasto:pixelsize=80}${time  %S}Sec${if_match ${time  %S}>1}s${endif}${font}${color}

${goto 10}${voffset 50}DMSEG: ${exec dmesg |tail -n 5}

${color1}${goto 30}${voffset -385}${font Antipasto:pixelsize=25}${execp python ~/.config/conky/MConky/artist.py}
${goto 30}${voffset -10}${scroll 21 2 ${exec python ~/.config/conky/MConky/title.py}}${font}${color}

${exec python ~/.config/conky/MConky/imageurl.py}
${image  ~/.config/conky/MConky/circle_imageurl.png -p 255,255 -s 230x230 -n}
${image  ~/.config/conky/MConky/makonplay.png -p 230,215 -s 64x64 -n}

${goto 980}${voffset -350}${font Antipasto:pixelsize=50}${if_match ${desktop}==1}${color1}${endif}•${color}
${goto 980}${voffset -45}${if_match ${desktop}==2}${color1}${endif}•${color}
${goto 980}${voffset -45}${if_match ${desktop}==3}${color1}${endif}•${color}
${goto 980}${voffset -45}${if_match ${desktop}==4}${color1}${endif}•${color}${font}
]]
