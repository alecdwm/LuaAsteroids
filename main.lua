debug = {}
debug.enabled = true

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

-- Game Files --
audio =				require "audio"
debris =			require "debris"
npcship =			require "npcship"
player =			require "player"
projectiles =		require "projectiles"

-- Callbacks --
function love.load()
	love.graphics.setBackgroundColor(0,0,0)
	audio.load()
	debris.load()
	npcship.load()
	player.load()
	projectiles.load()
end

function love.update(dt)
	audio.update(dt)
	debris.update(dt)
	npcship.update(dt)
	player.update(dt)
	projectiles.update(dt)
end

function love.draw()
	debris.draw()
	npcship.draw()
	player.draw()
	projectiles.draw()
end

function love.keypressed(key)
	if key == "escape" or key == "q" then
		love.event.quit()
	end
end