-- Dev Commands
devspace = {}
devspace.debug = true

-- Libraries --
gamestate =		require "libraries.hump.gamestate"
vector =		require "libraries.hump.vector"
class =			require "libraries.hump.class"
timer =			require "libraries.hump.timer"
beholder =		require "libraries.beholder"

-- Game Systems --
stateSystem =	require "aster-ids.stateSystem"
eclSystem =		require "aster-ids.eclSystem"

function love.load()
	stateSystem.load()
end

--[[ Game Objects --
local gameobjects = {}
gameobjects.ourship = {}
gameobjects.bullets = {}
gameobjects.asteroidLgs = {}
gameobjects.asteroidMids = {}
gameobjects.asteroidSms = {}

function love.load()
	require "aster-ids.music"
	require "aster-ids.sound"
	require "aster-ids.player"
	require "aster-ids.bullet"
	require "aster-ids.asteroidLg"
	require "aster-ids.asteroidMid"
	require "aster-ids.asteroidSm"
	sound:init()
	gamestate.registerEvents()
	gamestate.switch(menu)
end]]