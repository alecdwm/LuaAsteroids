player = {}

vector = require "libraries.hump.vector"
require "libraries.glowShape"

local shipverts =	{	 00, 20,
						 15,-15,
						 05,-10,
						-05,-10,
						-15,-15		}
local thrustverts =	{	-05,-10,
						 00,-20,
						 05,-10,
						 00,-00		}

function player:create()
	local newObj = {}
	newObj.position = vector(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
	newObj.rotation = math.pi
	newObj.velocity = vector(0,0)
	newObj.mass = 100
	newObj.thrust = 120
	newObj.spin = 6
	newObj.dragFactor = 0.9
	newObj.drawshape = shipverts
	newObj.drawshape1 = thrustverts
	newObj.drawshape1_active = false
	newObj.color = {255,255,255,255}
	self.__index = self
	return setmetatable(newObj,self)
end

function player:update(dt)
	---- Take Player Input
	-- Ship Turning Control
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		self.rotation = self.rotation - self.spin * dt
	end
	if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		self.rotation = self.rotation + self.spin * dt
	end
	-- Acceleration/Deceleration Control
	if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
		self.drawshape1_active = true
		audio.thrust:play()
	else
		self.drawshape1_active = false
		audio.thrust:stop()
	end

	---- Move Ship
	--self.position = self.position + self.velocity:rotated(self.rotation) * dt
	--self.position = self.position + self.velocity * dt

	---- Apply Environmental Constraints
	-- Off Screen
	--[[if self.position.x > love.graphics.getWidth() then
		self.position.x = 0
	end
	if self.position.y > love.graphics.getHeight() then
		self.position.y = 0
	end
	if self.position.x < 0 then
		self.position.x = love.graphics.getWidth()
	end
	if self.position.y < 0 then
		self.position.y = love.graphics.getHeight()
	end]]
end

function player:draw()
	local x,y = self.position:unpack()

	love.graphics.push()
	love.graphics.translate(x,y)
	love.graphics.rotate(self.rotation)
	if self.drawshape1_active then
		show = math.random()
		if show < 0.08 then
			-- Don't show anything
		else
			glowShape(0,191,255,"polygon",self.drawshape1) -- blue
		end
	end
	love.graphics.setColor(0,0,0,255)
	love.graphics.polygon("fill",self.drawshape) --[[ This
	makes the background of the ship black to prevent the
	inner glow from the	thruster being visible from inside
	the ship. ]]
	glowShape(255,255,255,"polygon",self.drawshape)
	love.graphics.pop()
end