-- Class Setup --
debris = {}

-- Objects --
debris.large = {}
debris.medium = {}
debris.small = {}
function debris.large:create(id)
    local newObj = {}
    newObj.id = id
    newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
    newObj.velocity = vector(math.random(-25,25),math.random(-25,25))
    newObj.rotation = math.random(0,2*math.pi)
    newObj.spin = math.random(-.1,.1)
    newObj.active = true
    newObj.color = {255,255,255,255}
    newObj.shape = collider:addPolygon(20,50, 50,00, 30,-30, -10,-50, -50,-20, -30,40)
    newObj.shape:moveTo(newObj.position.x,newObj.position.y)
    newObj.shape:setRotation(newObj.rotation)
    newObj.shape.type = "largeAsteroid"
    newObj.shape.collide = (function(dt,self,object) debris.largeCollision(dt,self,object) end)
    newObj.shape.obj = newObj
    self.__index = self
    return setmetatable(newObj,self)
end
function debris.medium:create(id)
    local newObj = {}
    newObj.id = id
    newObj.position = vector(math.random(0,love.graphics.getWidth()),math.random(0,love.graphics.getHeight()))
    newObj.velocity = vector(math.random(-35,35),math.random(-35,35))
    newObj.rotation = math.random(0,2*math.pi)
    newObj.spin = math.random(-.5,.5)
    newObj.active = false
    newObj.color = {255,255,255,255}
    newObj.shape = collider:addPolygon(05,25, 25,15, 15,-05, 25,-15, -05,-25, -25,-05, -15,15)
    newObj.shape:moveTo(newObj.position.x,newObj.position.y)
    newObj.shape:setRotation(newObj.rotation)
    newObj.shape.type = "mediumAsteroid"
    newObj.shape.collide = (function(dt,self,object) debris.mediumCollision(dt,self,object) end)
    newObj.shape.obj = newObj
    collider:setGhost(newObj.shape)
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
    newObj.active = false
    newObj.color = {255,255,255,255}
    newObj.shape = collider:addPolygon(-05,05, 02,10, 05,02, 10,-01, 03,-10, -02,-09, -04,-05, -10,02, -10,05)
    newObj.shape:moveTo(newObj.position.x,newObj.position.y)
    newObj.shape:setRotation(newObj.rotation)
    newObj.shape.type = "smallAsteroid"
    newObj.shape.collide = (function(dt,self,object) debris.smallCollision(dt,self,object) end)
    collider:setGhost(newObj.shape)
    newObj.shape.obj = newObj
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

function debris.largeCollision(dt,self,object)
    --[[if object.type == "largeAsteroid" or object.type == "mediumAsteroid" or object.type == "smallAsteroid" then
        --self.obj.velocity.x = self.obj.velocity.x + math.cos(self.obj.rotation) * (object.obj.position.x-self.obj.position.x) * dt
        --self.obj.velocity.y = self.obj.velocity.y + math.sin(self.obj.rotation) * (object.obj.position.y-self.obj.position.y) * dt
        self.obj.velocity.x = -self.obj.velocity.x
        self.obj.velocity.y = -self.obj.velocity.y
        self.obj.spin = object.obj.spin
    end]]
    if object.type == "projectile" then
        for i=1,3,1 do
            for key,ent in pairs(debris.mediumList) do
                if ent.active == true then
                    i = i - 1
                else
                    ent.position.x = self.obj.position.x + math.random(-40,40)
                    ent.position.y = self.obj.position.y + math.random(-40,40)
                    ent.active = true
                    break
                end
            end
        end
        audio.triggerSound("bangLarge")
        self.obj.active = false
    end
end
function debris.mediumCollision(dt,self,object)
    --[[if object.type == "largeAsteroid" or object.type == "mediumAsteroid" or object.type == "smallAsteroid" then
        --self.obj.velocity.x = self.obj.velocity.x + math.cos(self.obj.rotation) * (object.obj.position.x-self.obj.position.x) * dt
        --self.obj.velocity.y = self.obj.velocity.y + math.sin(self.obj.rotation) * (object.obj.position.y-self.obj.position.y) * dt
        self.obj.velocity.x = -self.obj.velocity.x
        self.obj.velocity.y = -self.obj.velocity.y
        self.obj.spin = object.obj.spin
    end]]
    if object.type == "projectile" then
        for i=1,3,1 do
            for key,ent in pairs(debris.smallList) do
                if ent.active == true then
                    i = i - 1
                else
                    ent.position.x = self.obj.position.x + math.random(-20,20)
                    ent.position.y = self.obj.position.y + math.random(-20,20)
                    ent.active = true
                    break
                end
            end
        end
        audio.triggerSound("bangMedium")
        self.obj.active = false
    end
end
function debris.smallCollision(dt,self,object)
    --[[if object.type == "largeAsteroid" or object.type == "mediumAsteroid" or object.type == "smallAsteroid" then
        --self.obj.velocity.x = self.obj.velocity.x + math.cos(self.obj.rotation) * (object.obj.position.x-self.obj.position.x) * dt
        --self.obj.velocity.y = self.obj.velocity.y + math.sin(self.obj.rotation) * (object.obj.position.y-self.obj.position.y) * dt
        self.obj.velocity.x = -self.obj.velocity.x
        self.obj.velocity.y = -self.obj.velocity.y
        self.obj.spin = object.obj.spin
    end]]
    if object.type == "projectile" then
        audio.triggerSound("bangSmall")
        self.obj.active = false
    end
end

-- Callbacks --
function debris.load()
    for i=1,7 do
        debris.largeList[i] = debris.large:create(i)
    end
    for i=1,21 do
        debris.mediumList[i] = debris.medium:create(i)
    end
    for i=1,63 do
        debris.smallList[i] = debris.small:create(i)
    end
end

function debris.update(dt)
    for key,ent in pairs(debris.largeList) do
        if ent.active then
            if collider._ghost_shapes[ent.shape] then
                collider:setSolid(ent.shape)
            end
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
            -- Move Shape
            ent.shape:moveTo(ent.position.x,ent.position.y)
            ent.shape:setRotation(ent.rotation)
        else
            if not collider._ghost_shapes[ent.shape] then
                collider:setGhost(ent.shape)
            end
        end
    end
    for key,ent in pairs(debris.mediumList) do
        if ent.active then
            if collider._ghost_shapes[ent.shape] then
                collider:setSolid(ent.shape)
            end
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
            -- Move Shape
            ent.shape:moveTo(ent.position.x,ent.position.y)
            ent.shape:setRotation(ent.rotation)
        else
            if not collider._ghost_shapes[ent.shape] then
                collider:setGhost(ent.shape)
            end
        end
    end
    for key,ent in pairs(debris.smallList) do
        if ent.active then
            if collider._ghost_shapes[ent.shape] then
                collider:setSolid(ent.shape)
            end
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
            -- Move Shape
            ent.shape:moveTo(ent.position.x,ent.position.y)
            ent.shape:setRotation(ent.rotation)
        else
            if not collider._ghost_shapes[ent.shape] then
                collider:setGhost(ent.shape)
            end
        end
    end
end

function debris.draw()
    for key,ent in pairs(debris.largeList) do
        if ent.active then
            love.graphics.setColor(ent.color)
            ent.shape:draw("line")
        end
    end
    for key,ent in pairs(debris.mediumList) do
        if ent.active then
            love.graphics.setColor(ent.color)
            ent.shape:draw("line")
        end
    end
    for key,ent in pairs(debris.smallList) do
        if ent.active then
            love.graphics.setColor(ent.color)
            ent.shape:draw("line")
        end
    end
end

return debris
