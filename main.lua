audio = {}

function love.load()
	require("aster-ids.player")
	audio.thrust = love.audio.newSource("aster-ids/audio/thrust.wav")
	audio.thrust:setLooping(true)

	love.graphics.setBackgroundColor(0,0,0)

	ourship = player:create()
end

function love.update(dt)
	ourship:update(dt)
end

function love.draw()
	ourship:draw()
end

function love.keypressed(key)
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end