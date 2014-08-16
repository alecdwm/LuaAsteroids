debug = {}
debug.enabled = true

-- Libraries --
class =				require "libraries.hump.class"
vector =			require "libraries.hump.vector"
HardonCollider =	require "libraries.hardoncollider"

-- Game Files --
audio =				require "audio"
debris =			require "debris"
npcship =			require "npcship"
player =			require "player"
projectiles =		require "projectiles"

-- Functions --
function onCollision(dt,shapeA,shapeB)
	shapeA.collide(dt,shapeA,shapeB)
	shapeB.collide(dt,shapeB,shapeA)
end

-- Callbacks --
function love.load()
	love.graphics.setBackgroundColor(0,0,0)
	math.randomseed(os.time())

	collider = HardonCollider(100,onCollision)

	audio.load()
	debris.load()
	npcship.load()
	player.load()
	projectiles.load()
end

function love.update(dt)
	collider:update(dt)

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