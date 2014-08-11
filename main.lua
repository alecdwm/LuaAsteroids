local gamestate = require "libraries.hump.gamestate"
local signals = require "libraries.hump.signal"

local menu = {}
game = {}

game.ourship = {}
game.bullets = {}
game.asteroidLgs = {}
game.asteroidMids = {}
game.asteroidSms = {}

function menu:enter()
	menu.font = love.graphics.setNewFont(20)
end

function menu:draw()
	love.graphics.print("ASTERÖIDS",love.graphics.getWidth()/2,love.graphics.getHeight()/2-15,0,1,1,menu.font:getWidth("ASTER-IDS")/2,menu.font:getHeight("ASTER-IDS")/2)
	love.graphics.print("Press ENTER to Play",love.graphics.getWidth()/2,love.graphics.getHeight()/2+10,0,1,1,menu.font:getWidth("Press Enter to Play")/2,menu.font:getHeight("Press Enter to Play")/2)
end

function menu:keypressed(key)
	if key == "return" then
		gamestate.switch(game)
	end
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end

function game:enter()
	require "aster-ids.music"
	require "aster-ids.player"
	require "aster-ids.bullet"
	require "aster-ids.asteroidLg"
	require "aster-ids.asteroidMid"
	require "aster-ids.asteroidSm"

	game.signalregistry = signals.new()

	love.graphics.setBackgroundColor(0,0,0)

	game.ourship = player:create()

	for i=0,20 do
		game.bullets[i] = bullet:create(i)
	end
	for i=0,6 do
		game.asteroidLgs[i] = asteroidLg:create(i)
	end
	for i=0,12 do
		game.asteroidMids[i] = asteroidMid:create(i)
	end
	for i=0,27 do
		game.asteroidSms[i] = asteroidSm:create(i)
	end
end

function game:update(dt)
	music.update(dt)
	game.ourship:update(dt)
	for key,ent in pairs(game.bullets) do
		ent:update(dt)
	end
	for key,ent in pairs(game.asteroidLgs) do
		ent:update(dt)
	end
	for key,ent in pairs(game.asteroidMids) do
		ent:update(dt)
	end
	for key,ent in pairs(game.asteroidSms) do
		ent:update(dt)
	end
end

function game:draw()
	for key,ent in pairs(game.bullets) do
		ent:draw()
	end
	for key,ent in pairs(game.asteroidLgs) do
		ent:draw()
	end
	for key,ent in pairs(game.asteroidMids) do
		ent:draw()
	end
	for key,ent in pairs(game.asteroidSms) do
		ent:draw()
	end
	game.ourship:draw()
end

function game:keypressed(key)
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end

function love.load()
	gamestate.registerEvents()
	gamestate.switch(menu)
end