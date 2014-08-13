game = {}

function game:enter()
	love.graphics.setBackgroundColor(0,0,0)

	gameobjects.ourship = player:create()

	for i=0,20 do
		gameobjects.bullets[i] = bullet:create(i)
	end
	for i=0,6 do
		gameobjects.asteroidLgs[i] = asteroidLg:create(i)
	end
	for i=0,12 do
		gameobjects.asteroidMids[i] = asteroidMid:create(i)
	end
	for i=0,27 do
		gameobjects.asteroidSms[i] = asteroidSm:create(i)
	end
end

function game:update(dt)
	--music.update(dt)
	gameobjects.ourship:update(dt)
	for key,ent in pairs(gameobjects.bullets) do
		ent:update(dt)
	end
	for key,ent in pairs(gameobjects.asteroidLgs) do
		ent:update(dt)
	end
	for key,ent in pairs(gameobjects.asteroidMids) do
		ent:update(dt)
	end
	for key,ent in pairs(gameobjects.asteroidSms) do
		ent:update(dt)
	end
end

function game:draw()
	for key,ent in pairs(gameobjects.bullets) do
		ent:draw()
	end
	for key,ent in pairs(gameobjects.asteroidLgs) do
		ent:draw()
	end
	for key,ent in pairs(gameobjects.asteroidMids) do
		ent:draw()
	end
	for key,ent in pairs(gameobjects.asteroidSms) do
		ent:draw()
	end
	gameobjects.ourship:draw()
end

function game:keypressed(key)
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end

return game