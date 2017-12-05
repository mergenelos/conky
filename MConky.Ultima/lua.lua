--[[

This script draws percentage meters as rings. It is fully customisable; all options are described in the script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement on line 145 uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
	lua_load ~/scripts/rings-v1.2.1.lua
	lua_draw_hook_pre ring_stats

Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)
]]



settings_table = {
	{
		name='cpu',
		arg='cpu0',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00C9FF,
		fg_alpha=1.0,
		x=375, y=375,
		radius=245,
		thickness=7,
		start_angle=0,
		end_angle=135
	},
	{
		name='memperc',
		arg='',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xf0f8ff,
		fg_alpha=1.0,
		x=375, y=375,
		radius=225,
		thickness=7,
		start_angle=0,
		end_angle=135
	},
	{
		name='swapperc',
		arg='',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x47B13E,
		fg_alpha=1.0,
		x=375, y=375,
		radius=213,
		thickness=7,
		start_angle=0,
		end_angle=135
	},
	{
		name='upspeedf',
		arg='wlp8s0',
		max=30,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00FF00,
		fg_alpha=1.0,
		x=375, y=375,
		radius=193,
		thickness=7,
		start_angle=0,
		end_angle=135
	},
	{
		name='downspeedf',
		arg='wlp8s0',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x1ba1e2,
		fg_alpha=1.0,
		x=375, y=375,
		radius=181,
		thickness=7,
		start_angle=0,
		end_angle=135
	},
	{
		name='fs_used_perc',
		arg='/',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xf09609,
		fg_alpha=1.0,
		x=375, y=375,
		radius=161,
		thickness=7,
		start_angle=0,
		end_angle=360
	},
	{
		name='fs_used_perc',
		arg='/home',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xa200ff,
		fg_alpha=1.0,
		x=375, y=375,
		radius=149,
		thickness=7,
		start_angle=0,
		end_angle=360
	},
	{
		name='fs_used_perc',
		arg='/home',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xff0097,
		fg_alpha=1.0,
		x=375, y=375,
		radius=137,
		thickness=7,
		start_angle=0,
		end_angle=360
	},
	{
		name='fs_used_perc',
		arg='/home/mak/',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00aba9,
		fg_alpha=1.0,
		x=375, y=375,
		radius=125,
		thickness=7,
		start_angle=0,
		end_angle=360
	},
	{
		name='time',
		arg='%I',
		max=12,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xf0f8ff,
		fg_alpha=1.0,
		x=375, y=375,
		radius=181,
		thickness=7,
		start_angle=135,
		end_angle=225
	},
	{
		name='time',
		arg='%M',
		max=60,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00FF00,
		fg_alpha=1.0,
		x=375, y=375,
		radius=193,
		thickness=7,
		start_angle=135,
		end_angle=225
	},
	{
		name='time',
		arg='%S',
		max=60,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00C9FF,
		fg_alpha=1.0,
		x=375, y=375,
		radius=205,
		thickness=7,
		start_angle=135,
		end_angle=225
	},
	{
		name='battery_percent',
		arg='BAT1',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00C9FF,
		fg_alpha=1.0,
		x=375, y=375,
		radius=205,
		thickness=7,
		start_angle=305,
		end_angle=325
	},
	{
		name='battery_percent',
		arg='BAT1',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00C9FF,
		fg_alpha=1.0,
		x=375, y=375,
		radius=270,
		thickness=7,
		start_angle=45,
		end_angle=135
	},
	{
		name='battery_percent',
		arg='BAT1',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x00C9FF,
		fg_alpha=1.0,
		x=375, y=375,
		radius=550,
		thickness=7,
		start_angle=68,
		end_angle=112
	},
	{
		name='staticRing',
		arg='stay',
		max=100,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0xff0097,
		fg_alpha=1.0,
		x=375, y=375,
		radius=115,
		thickness=4,
		start_angle=0,
		end_angle=360
	},
	{
		name='playRing',
		arg='play',
		now=1,
		max=200,
		bg_colour=0xffffff,
		bg_alpha=0.0,
		fg_colour=0x2baad7,
		fg_alpha=1.0,
		x=375, y=375,
		radius=115,
		thickness=4,
		start_angle=0,
		end_angle=360
	},
}

require 'cairo'

function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)
	local w,h=conky_window.width,conky_window.height

	local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
	local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

	local angle_0=sa*(2*math.pi/360)-math.pi/2
	local angle_f=ea*(2*math.pi/360)-math.pi/2
	local t_arc=t*(angle_f-angle_0)

	-- Draw background ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_set_line_width(cr,ring_w)
	cairo_stroke(cr)

	-- Draw indicator ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
	cairo_stroke(cr)
end

function conky_ring_stats()

	local function setup_rings(cr,pt)
		local str=''
		local value=0

		if pt['name']=="playRing" then
			value=tonumber(pt['now'])
		elseif pt['name']=="staticRing" then
				value=100
		else
			str=string.format('${%s %s}',pt['name'],pt['arg'])
			str=conky_parse(str)

			value=tonumber(str)
		end
		if value == nil then value = 0 end
		pct=value/pt['max']

		draw_ring(cr,pct,pt)
	end

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
	local cr=cairo_create(cs)
	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)
	if update_num>5 then
		-- This will open the file
		local fileringcolor = io.popen('python ~/.config/conky/MConky/playRingColor.py')
		-- This will read all of the output, as alway
		local outputringcolor = fileringcolor:read('*all')
		-- This will get a table with some return stuff
								-- rc[1] will be true, false or nil
		-- rc[3] will be the signal
		local rc = {fileringcolor:close()}

		for i in pairs(settings_table) do
			if settings_table[i]['name'] == "staticRing" then
				if outputringcolor == 'blue' then settings_table[i]['fg_colour']=0x2baad7 else settings_table[i]['fg_colour']=0xff0097 end
			end

			if settings_table[i]['name'] == "playRing" then

				if outputringcolor == 'blue' then settings_table[i]['fg_colour']=0xff0097 else settings_table[i]['fg_colour']=0x2baad7 end

				-- This will open the file
				local filecompletetime = io.popen('python ~/.config/conky/MConky/completetime.py')
				-- This will read all of the output, as always
				local outputcompletetime = filecompletetime:read('*all')
				-- This will get a table with some return stuff
				-- rc[1] will be true, false or nil
				-- rc[3] will be the signal
				local rc = {filecompletetime:close()}
				settings_table[i]['max']=outputcompletetime


				-- This will open the file
				local fileplayPast = io.popen('python ~/.config/conky/MConky/playPast.py')
				-- This will read all of the output, as always
				local outputplayPast = fileplayPast:read('*all')
				-- This will get a table with some return stuff
				-- rc[1] will be true, false or nil
				-- rc[3] will be the signal
				local rc = {fileplayPast:close()}
				settings_table[i]['now']=outputplayPast


			end

			setup_rings(cr,settings_table[i])
		end

	end
	return ""
end

require 'imlib2'

function init_drawing_surface()
    imlib_set_cache_size(1366 * 768)
    imlib_context_set_dither(1)
end

function draw_image()
    init_drawing_surface()
    --/home/mak/.config/conky/MConky/mark.png
    --you'll need to change the path here (keep it absolute!)
    image = imlib_load_image("")
    if image == nil then return end
    imlib_context_set_image(image)
	imlib_render_image_on_drawable(1250,90)
	imlib_free_image()
end


function conky_start()
    if conky_window == nil then return end
    draw_image()
end
