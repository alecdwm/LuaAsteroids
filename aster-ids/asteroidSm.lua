asteroidSm = {}

vector = require "libraries.hump.vector"

local asteroidSmVerts =	{	-05, 05,
							 02, 10,
							 05, 02,
							 10,-01,
							 03,-10,
							-02,-09,
							-04,-05,
							-10,-02,
							-10, 05		}

function asteroidSm:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
	newObj.velocity = vector(math.random(-50,50),math.random(-50,50))
	newObj.rotation = math.random(0,2*math.pi)
	newObj.spin = math.random(-1,1)
	newObj.active = false
	newObj.drawshape = asteroidSmVerts
	newObj.color = {255,255,255,255}
	self.__index = self
	return setmetatable(newObj,self)
end

function asteroidSm:update(dt)
	if not self.active then return end
	self.position = self.position + self.velocity * dt
	self.rotation = self.rotation + self.spin * dt

	---- Apply Environmental Constraints
	-- Off Screen
	if self.position.x > love.graphics.getWidth() then
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
	end
end

function asteroidSm:draw()
	if not self.active then return end
	local x,y = self.position:unpack()
	love.graphics.setColor(255,255,255,255)

	love.graphics.setColor(self.color)

	love.graphics.push()
	love.graphics.translate(x,y)
	love.graphics.rotate(self.rotation-math.pi/2)
	love.graphics.setColor(255,255,255,255)
	love.graphics.polygon("line",self.drawshape)
	love.graphics.pop()
end