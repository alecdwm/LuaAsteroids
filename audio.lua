-- Class Setup --
audio = class{}

-- Variables --
local dtotal = 0
local nextbeat = 1
local frequency = 1

local bangLarge = 0
local bangMedium = 0
local bangSmall = 0
local beat1 = 0
local beat2 = 0
local extraShip = 0
local fire = 0
local saucerBig = 0
local saucerSmall = 0
local thrust = 0

-- Functions --
function audio.triggerSound(sound)
	if sound == "bangLarge" then
		bangLarge:stop()
		bangLarge:play()
	end
	if sound == "bangMedium" then
		bangMedium:stop()
		bangMedium:play()
	end
	if sound == "bangSmall" then
		bangSmall:stop()
		bangSmall:play()
	end
	if sound == "beat1" then
		beat1:stop()
		beat1:play()
	end
	if sound == "beat2" then
		beat2:stop()
		beat2:play()
	end
	if sound == "extraShip" then
		extraShip:stop()
		extraShip:play()
	end
	if sound == "fire" then
		fire:stop()
		fire:play()
	end
	if sound == "saucerBig" then
		saucerBig:stop()
		saucerBig:play()
	end
	if sound == "saucerSmall" then
		saucerSmall:stop()
		saucerSmall:play()
	end
end

function audio.startLoop(sound)
	if sound == "thrust" then
		thrust:play()
	end
end

function audio.stopLoop(sound)
	if sound == "thrust" then
		thrust:stop()
	end
end

function audio.playBeat()
	if nextBeat == 1 then
		audio.triggerSound("beat1")
		nextBeat = 2
	else
		audio.triggerSound("beat2")
		nextBeat = 1
		if frequency < 0.2 then
			-- Do Nothing
		else
			frequency = frequency * .99
		end
	end
end

-- Callbacks --
function audio.load()
	bangLarge = 	love.audio.newSource("audio/bangLarge.wav")
	bangMedium = 	love.audio.newSource("audio/bangMedium.wav")
	bangSmall = 	love.audio.newSource("audio/bangSmall.wav")
	beat1 = 		love.audio.newSource("audio/beat1.wav")
	beat2 = 		love.audio.newSource("audio/beat2.wav")
	extraShip = 	love.audio.newSource("audio/extraShip.wav")
	fire = 			love.audio.newSource("audio/fire.wav")
	saucerBig = 	love.audio.newSource("audio/saucerBig.wav")
	saucerSmall = 	love.audio.newSource("audio/saucerSmall.wav")
	thrust = 		love.audio.newSource("audio/thrust.wav")

	thrust:setLooping(true)
end

function audio.update(dt)
	dtotal = dtotal + dt
	if dtotal >= frequency then
		dtotal = dtotal - frequency
		audio.playBeat()
	end
end

return audio