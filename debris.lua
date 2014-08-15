-- Class Setup --
debris = class{}

-- Variables --
local largeVerts = {	 20, 50,
						 50, 00,
						 30,-30,
						-10,-50,
						-50,-20,
						-30, 40		}

local mediumVerts = {	 05, 25,
						 25, 15,
						 15,-05,
						 25,-15,
						-05,-25,
						-25,-05,
						-15, 15		}

local smallVerts = {	-05, 05,
						 02, 10,
						 05, 02,
						 10,-01,
						 03,-10,
						-02,-09,
						-04,-05,
						-10,-02,
						-10, 05		}

-- Objects --
debris.large = {}
debris.medium = {}
debris.small = {}
function debris.large:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
	newObj.velocity = vector(math.random(-50,50),math.random(-50,50))
	newObj.rotation = math.random(0,2*math.pi)
	newObj.spin = math.random(-1,1)
	newObj.active = true
	newObj.drawshape = largeVerts
	newObj.color = {255,255,255,255}
	self.__index = self
	return setmetatable(newObj,self)
end
function debris.medium:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
	newObj.velocity = vector(math.random(-50,50),math.random(-50,50))
	newObj.rotation = math.random(0,2*math.pi)
	newObj.spin = math.random(-1,1)
	newObj.active = true
	newObj.drawshape = mediumVerts
	newObj.color = {255,255,255,255}
	self.__index = self
	return setmetatable(newObj,self)
end
function debris.small:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
	newObj.velocity = vector(math.random(-50,50),math.random(-50,50))
	newObj.rotation = math.random(0,2*math.pi)
	newObj.spin = math.random(-1,1)
	newObj.active = true
	newObj.drawshape = smallVerts
	newObj.color = {255,255,255,255}
	self.__index = self
	return setmetatable(newObj,self)
end

-- Object Instances --
debris.largeList = {}
debris.mediumList = {}
debris.smallList = {}

-- Functions --
function debris.newLarge(id)
	return debris.large:create(id)
end
function debris.newMedium(id)
	return debris.medium:create(id)
end
function debris.newSmall(id)
	return debris.small:create(id)
end

-- Callbacks --
function debris.load()
	for i=1,7 do
		debris.largeList[i] = debris.large:create(i)
	end
	for i=1,13 do
		debris.mediumList[i] = debris.medium:create(i)
	end
	for i=1,28 do
		debris.smallList[i] = debris.small:create(i)
	end
end

function debris.update(dt)
	for key,ent in pairs(debris.largeList) do
		if ent.active then
			ent.position = ent.position + ent.velocity * dt
			ent.rotation = ent.rotation + ent.spin * dt
			-- Off Screen
			if ent.position.x > love.graphics.getWidth() then
				ent.position.x = 0
			end
			if ent.position.y > love.graphics.getHeight() then
				ent.position.y = 0
			end
			if ent.position.x < 0 then
				ent.position.x = love.graphics.getWidth()
			end
			if ent.position.y < 0 then
				ent.position.y = love.graphics.getHeight()
			end
		end
	end
	for key,ent in pairs(debris.mediumList) do
		if ent.active then
			ent.position = ent.position + ent.velocity * dt
			ent.rotation = ent.rotation + ent.spin * dt
			-- Off Screen
			if ent.position.x > love.graphics.getWidth() then
				ent.position.x = 0
			end
			if ent.position.y > love.graphics.getHeight() then
				ent.position.y = 0
			end
			if ent.position.x < 0 then
				ent.position.x = love.graphics.getWidth()
			end
			if ent.position.y < 0 then
				ent.position.y = love.graphics.getHeight()
			end
		end
	end
	for key,ent in pairs(debris.smallList) do
		if ent.active then
			ent.position = ent.position + ent.velocity * dt
			ent.rotation = ent.rotation + ent.spin * dt
			-- Off Screen
			if ent.position.x > love.graphics.getWidth() then
				ent.position.x = 0
			end
			if ent.position.y > love.graphics.getHeight() then
				ent.position.y = 0
			end
			if ent.position.x < 0 then
				ent.position.x = love.graphics.getWidth()
			end
			if ent.position.y < 0 then
				ent.position.y = love.graphics.getHeight()
			end
		end
	end
end

function debris.draw()
	for key,ent in pairs(debris.largeList) do
		if ent.active then
			local x,y = ent.position:unpack()

			love.graphics.setColor(ent.color)

			love.graphics.push()
			love.graphics.translate(x,y)
			love.graphics.rotate(ent.rotation-math.pi/2)
			love.graphics.setColor(255,255,255,255)
			love.graphics.polygon("line",ent.drawshape)
			love.graphics.pop()
		end
	end
	for key,ent in pairs(debris.mediumList) do
		if ent.active then
			local x,y = ent.position:unpack()

			love.graphics.setColor(ent.color)

			love.graphics.push()
			love.graphics.translate(x,y)
			love.graphics.rotate(ent.rotation-math.pi/2)
			love.graphics.setColor(255,255,255,255)
			love.graphics.polygon("line",ent.drawshape)
			love.graphics.pop()
		end
	end
	for key,ent in pairs(debris.smallList) do
		if ent.active then
			local x,y = ent.position:unpack()

			love.graphics.setColor(ent.color)

			love.graphics.push()
			love.graphics.translate(x,y)
			love.graphics.rotate(ent.rotation-math.pi/2)
			love.graphics.setColor(255,255,255,255)
			love.graphics.polygon("line",ent.drawshape)
			love.graphics.pop()
		end
	end
end

return debris