-- Libraries --
gamestate = require "libraries.hump.gamestate"
vector = require "libraries.hump.vector"
signals = require "libraries.hump.signal"
beholder = require "libraries.beholder"

-- Game States --
local menu = {}
local game = {}

local gameobjects = {}
gameobjects.ourship = {}
gameobjects.bullets = {}
gameobjects.asteroidLgs = {}
gameobjects.asteroidMids = {}
gameobjects.asteroidSms = {}

function love.load()
	require "aster-ids.music"
	require "aster-ids.sound"
	require "aster-ids.player"
	require "aster-ids.bullet"
	require "aster-ids.asteroidLg"
	require "aster-ids.asteroidMid"
	require "aster-ids.asteroidSm"
	sound:init()
	gamestate.registerEvents()
	gamestate.switch(menu)
end

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
	music.update(dt)
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