debug = {}
debug.enabled = true

-- Libraries --
class =				require "libraries.hump.class"
vector =			require "libraries.hump.vector"
HardonCollider =	require "libraries.hardoncollider"

-- Game Systems --
audio =			require "systems.audio"
debris =			require "systems.debris"
npcship =			require "systems.npcship"
player =			require "systems.player"
projectiles =		require "systems.projectiles"
states =			require "systems.states"

-- Callbacks --
function love.load()
	love.graphics.setBackgroundColor(0,0,0)
	math.randomseed(os.time())

	states.load()
end

function love.update(dt)
	states.update(dt)
end

function love.draw()
	states.draw()
end

function love.mousepressed(x,y,button)
	states.mousepressed(x,y,button)
end

function love.mousereleased(x,y,button)
	states.mousereleased(x,y,button)
end

function love.mousefocus(focus)
	states.mousefocus(focus)
end

function love.keypressed(key,isrepeat)
	if key == "escape" or key == "q" then
		love.event.quit()
	end
	states.keypressed(key,isrepeat)
end

function love.keyreleased(key)
	states.keyreleased(key)
end

function love.textinput(text)
	states.textinput(text)
end

function love.focus(focus)
	states.focus(focus)
end

function love.visible(visible)
	states.visible(visible)
end

function love.resize(w,h)
	states.resize(w,h)
end

function love.quit()
	states.quit()
end