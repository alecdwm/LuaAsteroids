local signals = require "libraries.hump.signal"

music = {}

local dtotal = 0
local nextbeat = 1
local frequency = 1

function music.update(dt)
	dtotal = dtotal + dt
	if dtotal >= frequency then
		dtotal = dtotal - frequency
		music.playBeat()
	end
end

function music.playBeat()
	if nextBeat == 1 then
		signals.emit("beat1")
		nextBeat = 2
	else
		signals.emit("beat2")
		nextBeat = 1
		if frequency < .2 then
			-- Do nothing
		else
			frequency = frequency * 0.99
		end
	end
end