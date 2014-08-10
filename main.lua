audio = {}

function love.load()
	require("aster-ids.music")
	require("aster-ids.player")
	audio.bangLarge = love.audio.newSource("aster-ids/audio/bangLarge.wav")
	audio.bangMedium = love.audio.newSource("aster-ids/audio/bangMedium.wav")
	audio.bangSmall = love.audio.newSource("aster-ids/audio/bangSmall.wav")
	audio.beat1 = love.audio.newSource("aster-ids/audio/beat1.wav")
	audio.beat2 = love.audio.newSource("aster-ids/audio/beat2.wav")
	audio.extraShip = love.audio.newSource("aster-ids/audio/extraShip.wav")
	audio.fire = love.audio.newSource("aster-ids/audio/fire.wav")
	audio.saucerBig = love.audio.newSource("aster-ids/audio/saucerBig.wav")
	audio.saucerSmall = love.audio.newSource("aster-ids/audio/saucerSmall.wav")
	audio.thrust = love.audio.newSource("aster-ids/audio/thrust.wav")
	audio.thrust:setLooping(true)

	love.graphics.setBackgroundColor(0,0,0)

	ourship = player:create()
end

function love.update(dt)
	music.update(dt)
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