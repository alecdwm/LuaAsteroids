-- Class Setup --
projectiles = class{}

-- Variables --
projectiles.radius = 1.5
projectiles.segments = 4

-- Objects --
projectiles.bullet = {}
function projectiles.bullet:create(id)
	local newObj = {}
	newObj.id = id
	newObj.position = vector(0,0)
	newObj.velocity = vector(0,0)
	newObj.lifetime = 0
	newObj.friendly = false
	newObj.dtotal = 0
	newObj.active = false
	newObj.color = {0,0,0,0}
	self.__index = self
	return setmetatable(newObj,self)
end

-- Object Instances --
projectiles.bulletList = {}

-- Functions --
function projectiles.newProjectile(id)
	return projectiles.bullet:create(id)
end

function projectiles.fireProjectile(x,y,rot,speed,offset,lifetime,friendly)
	for key,ent in pairs(projectiles.bulletList) do
		if not ent.active then
			audio.triggerSound("fire")
			ent.position = vector(x+math.cos(rot)*offset,y+math.sin(rot)*offset)
			ent.velocity = vector(math.cos(rot)*speed,math.sin(rot)*speed)
			ent.lifetime = lifetime
			ent.friendly = friendly
			ent.dtotal = 0
			if friendly then
				ent.color = {0,255,0,255}
			else
				ent.color = {255,0,0,255}
			end
			ent.active = true
			break
		end
	end
end

-- Callbacks --
function projectiles.load()
	for i=1,21 do
		projectiles.bulletList[i] = projectiles.newProjectile(i)
	end
end

function projectiles.update(dt)
	for key,ent in pairs(projectiles.bulletList) do
		if ent.active then
			ent.dtotal = ent.dtotal + dt
			if ent.dtotal >= ent.lifetime then
				ent.active = false
			else
				ent.position = ent.position + ent.velocity * dt

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
end

function projectiles.draw()
	for key,ent in pairs(projectiles.bulletList) do
		if ent.active then
			local x,y = ent.position:unpack()

			love.graphics.setColor(ent.color)
			love.graphics.setPointSize(2.5)
			love.graphics.circle("fill",x,y,projectiles.radius,projectiles.segments)
		end
	end
end

return projectiles