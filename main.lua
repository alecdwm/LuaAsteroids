-- Dev Commands
devspace = {}
devspace.debug = true

-- Libraries --
--camera =			require "libraries.hump.camera"
class =				require "libraries.hump.class"
gamestate =			require "libraries.hump.gamestate"
--signal =			require "libraries.hump.signal"
timer =				require "libraries.hump.timer"
vector =			require "libraries.hump.vector"
--vector-light =	require "libraries.hump.vector-light"
beholder =			require "libraries.beholder"
mlib =				require "libraries.mlib"

-- Game Systems --
stateSystem =		require "aster-ids.stateSystem"
eclSystem =			require "aster-ids.eclSystem"

function love.load()
	eclSystem.load()
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