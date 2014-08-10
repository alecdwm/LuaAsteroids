audio = {}

bullets = {}
asteroids = {}

function love.load()
	require "aster-ids.music"
	require "aster-ids.player"
	require "aster-ids.bullet"
	audio.bangLarge =	love.audio.newSource("aster-ids/audio/bangLarge.wav")
	audio.bangMedium =	love.audio.newSource("aster-ids/audio/bangMedium.wav")
	audio.bangSmall =	love.audio.newSource("aster-ids/audio/bangSmall.wav")
	audio.beat1 =		love.audio.newSource("aster-ids/audio/beat1.wav")
	audio.beat2 =		love.audio.newSource("aster-ids/audio/beat2.wav")
	audio.extraShip =	love.audio.newSource("aster-ids/audio/extraShip.wav")
	audio.fire =		love.audio.newSource("aster-ids/audio/fire.wav")
	audio.saucerBig =	love.audio.newSource("aster-ids/audio/saucerBig.wav")
	audio.saucerSmall =	love.audio.newSource("aster-ids/audio/saucerSmall.wav")
	audio.thrust =		love.audio.newSource("aster-ids/audio/thrust.wav")
	audio.thrust:setLooping(true)

	love.graphics.setBackgroundColor(0,0,0)

	ourship = player:create()

	for i=0,20 do
		bullets[i] = bullet:create(i)
	end
end

function love.update(dt)
	music.update(dt)
	ourship:update(dt)
	for key,ent in pairs(bullets) do
		ent:update(dt)
	end
end

function love.draw()
	for key,ent in pairs(bullets) do
		ent:draw()
	end
	ourship:draw()
end

function love.keypressed(key)
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end