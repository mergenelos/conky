local peaks = {}
function conky_netpeak(args)
    local iface, dir, speed = string.match(args, "^(.+) (.+) (.+)$");

    local dir = tostring(dir)
    if dir ~= "down" and dir ~= "up" then
        return "conky_netpeak: direction needs to be either up or down, not "..dir
    end

    if peaks[iface] == nil then
        peaks[iface] = {}
        peaks[iface].down = 0.0
        peaks[iface].up = 0.0
    end

    speed = tonumber(speed)
    if speed > peaks[iface][dir] then
        peaks[iface][dir] = speed
    end

    return string.format("%.1f", peaks[iface][dir])
end