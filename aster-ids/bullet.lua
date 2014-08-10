bullet = {}

vector = require "libraries.hump.vector"

function bullet:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(0,0)
	newObj.velocity = vector(0,0)
	newObj.friendly = false
	newObj.dtotal = 0
	newObj.lifetime = 0 -- seconds
	newObj.active = false
	newObj.color = {0,0,0,0}
	self.__index = self
	return setmetatable(newObj,self)
end

function bullet:fire(x,y,vx,vy,friendly,lifetime)
	self.position = vector(x,y)
	self.velocity = vector(vx,vy)
	self.friendly = friendly
	if friendly then
		self.color = {0,255,0,255}
	else
		self.color = {255,0,0,255}
	end
	self.dtotal = 0
	self.lifetime = lifetime
	self.active = true
end

function bullet:update(dt)
	if not self.active then return end
	self.dtotal = self.dtotal + dt
	if self.dtotal >= self.lifetime then
		self.active = false
	else
		self.position = self.position + self.velocity * dt

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
end

function bullet:draw(dt)
	if not self.active then return end
	local x,y = self.position:unpack()

	love.graphics.setColor(self.color)
	love.graphics.setPointSize(2)
	love.graphics.point(x,y)
end