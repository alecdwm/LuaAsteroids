-- State Setup --
game = {}
game.string = "game"

-- Variables --
game.paused = false

-- Functions --
function onCollision(dt,shapeA,shapeB)
	shapeA.collide(dt,shapeA,shapeB)
	shapeB.collide(dt,shapeB,shapeA)
end

-- Callbacks --
function game.stateEntry()
	collider = HardonCollider(100,onCollision)

	audio.load()
	debris.load()
	npcship.load()
	player.load()
	projectiles.load()
end

function game.update(dt)
	collider:update(dt)

	audio.update(dt)
	debris.update(dt)
	npcship.update(dt)
	player.update(dt)
	projectiles.update(dt)
end

function game.draw()
	debris.draw()
	npcship.draw()
	player.draw()
	projectiles.draw()
end

function game.keypressed(key)
end

function game.stateExit()
	love.event.quit()
end

return game