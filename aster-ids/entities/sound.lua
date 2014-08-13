sound = {}

sound.bangLarge = 0
sound.bangMedium = 0
sound.bangSmall = 0
sound.beat1 = 0
sound.beat2 = 0
sound.extraShip = 0
sound.fire = 0
sound.saucerBig = 0
sound.saucerSmall = 0
sound.thrust = 0

function sound:init()
	sound.bangLarge =	love.audio.newSource("aster-ids/audio/bangLarge.wav")
	sound.bangMedium =	love.audio.newSource("aster-ids/audio/bangMedium.wav")
	sound.bangSmall =	love.audio.newSource("aster-ids/audio/bangSmall.wav")
	sound.beat1 =		love.audio.newSource("aster-ids/audio/beat1.wav")
	sound.beat2 =		love.audio.newSource("aster-ids/audio/beat2.wav")
	sound.extraShip =	love.audio.newSource("aster-ids/audio/extraShip.wav")
	sound.fire =		love.audio.newSource("aster-ids/audio/fire.wav")
	sound.saucerBig =	love.audio.newSource("aster-ids/audio/saucerBig.wav")
	sound.saucerSmall =	love.audio.newSource("aster-ids/audio/saucerSmall.wav")
	sound.thrust =		love.audio.newSource("aster-ids/audio/thrust.wav")
	sound.thrust:setLooping(true)
end

beholder.observe("thrust-start", function()
	sound.thrust:play()
end)

beholder.observe("thrust-stop", function()
	sound.thrust:stop()
end)

beholder.observe("beat1", function()
	sound.beat1:play()
end)

beholder.observe("beat2", function()
	sound.beat2:play()
end)