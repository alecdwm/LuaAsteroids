local class = require "libraries.hump.class"
local signals = require "libraries.hump.signal"

sound = class{}

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

function sound:init()
	bangLarge =	love.audio.newSource("aster-ids/audio/bangLarge.wav")
	bangMedium =	love.audio.newSource("aster-ids/audio/bangMedium.wav")
	bangSmall =	love.audio.newSource("aster-ids/audio/bangSmall.wav")
	beat1 =		love.audio.newSource("aster-ids/audio/beat1.wav")
	beat2 =		love.audio.newSource("aster-ids/audio/beat2.wav")
	extraShip =	love.audio.newSource("aster-ids/audio/extraShip.wav")
	fire =		love.audio.newSource("aster-ids/audio/fire.wav")
	saucerBig =	love.audio.newSource("aster-ids/audio/saucerBig.wav")
	saucerSmall =	love.audio.newSource("aster-ids/audio/saucerSmall.wav")
	thrust =		love.audio.newSource("aster-ids/audio/thrust.wav")
	thrust:setLooping(true)
end

game.signalregistry:register("thrust-start", function()
	thrust:play()
end)

game.signalregistry:register("thrust-end", function()
	thrust:stop()
end)

game.signalregistry:register("beat1", function()
	beat1:play()
end)

game.signalregistry:register("beat2", function()
	beat2:play()
end)