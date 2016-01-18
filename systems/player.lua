-- Class Setup --
player = {}

-- Objects --
player.ship = {}
function player.ship:create(x,y,rot)
    local newObj = {}
    newObj.position = vector(x,y)
    newObj.rotation = rot
    newObj.velocity = vector(0,0)
    newObj.thrust = 120
    newObj.spin = 4
    newObj.canfire = true
    newObj.dtotal = 0
    newObj.fireFrequency = 0.5
    newObj.color = {255,255,255,255}
    newObj.shape = collider:addPolygon(00,20, 15,-15, 05,-10, -05,-10, -15,-15)
    newObj.thrustshape = collider:addPolygon(-05,-10, 00,-20, 05,-10)
    collider:setGhost(newObj.thrustshape)
    newObj.thrustshape.active = false
    newObj.shape:moveTo(newObj.position.x,newObj.position.y)
    newObj.shape:setRotation(newObj.rotation)
    newObj.shape.type = "playerShip"
    newObj.shape.collide = (function(dt,self,object) player.collision(dt,self,object) end)
    newObj.shape.obj = newObj
    self.__index = self
    return setmetatable(newObj,self)
end

-- Object Instances --
player.playerOneShip = {}

-- Functions --
function player.collision(dt,self,object)
    --print("DT: "..dt.."\nSELF: "..self.type.."\nOBJECT: "..object.type)
    if object.type == "largeAsteroid" or object.type == "mediumAsteroid" or object.type == "smallAsteroid" then
        player.playerOneShip:explode()
        -- Kill Player
    end
    audio.triggerSound("saucerBig")
end

function player.ship:explode()
    love.event.quit()
end

function player.ship:playerInput(dt)
    -- Ship Turning Control
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        -- Turn left
        self.rotation = self.rotation - self.spin * dt
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        -- Turn right
        self.rotation = self.rotation + self.spin * dt
    end
    -- Acceleration/Deceleration Control
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        -- Effects
        if not self.thrustshape_active then
            self.thrustshape_active = true
            audio.startLoop("thrust")
        end

        -- Calculations
        self.velocity.x = self.velocity.x + math.cos(self.rotation) * self.thrust * dt
        self.velocity.y = self.velocity.y + math.sin(self.rotation) * self.thrust * dt
    else
        -- Effects
        if self.thrustshape_active then
            self.thrustshape_active = false
            audio.stopLoop("thrust")
        end
    end
    -- Weapons
    if not self.canfire then
        if self.dtotal >= self.fireFrequency then
            self.dtotal = 0
            self.canfire = true
        else
            self.dtotal = self.dtotal + dt
        end
    end
    if love.keyboard.isDown("space") then
        if self.canfire then
            self:fire()
            self.canfire = false
        end
    end
end

function player.ship:moveShip(dt)
    self.position = self.position + self.velocity * dt
end

function player.ship:reactEnvironment(dt)
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

function player.ship:draw()
    if self.thrustshape_active then
        show = math.random()
        if show < 0.08 then
            -- Don't show anything
        else
            love.graphics.setColor(0,191,255,255)
            self.thrustshape:draw("line")
        end
    end
    love.graphics.setColor(player.playerOneShip.color)
    self.shape:draw("line")
end

function player.ship:fire()
    local x,y = self.position:unpack()
    local rot = self.rotation
    local speed = 400 + math.sqrt(self.velocity.x^2+self.velocity.y^2) -- 400 + our speed
    local offset = 20 -- distance from center of ship to point at top
    local lifetime = 1
    local friendly = true
    projectiles.fireProjectile(x,y,rot,speed,offset,lifetime,friendly)
end

-- Callbacks --
function player.load()
    player.playerOneShip = player.ship:create(love.graphics.getWidth()/2,love.graphics.getHeight()/2,3*math.pi/2)
end

function player.update(dt)
    -- Take Player Input (movement/weapons)
    player.playerOneShip:playerInput(dt)

    -- Move Ship
    player.playerOneShip:moveShip(dt)

    -- Apply Environmental Constraints
    player.playerOneShip:reactEnvironment(dt)

    -- Move Shapes
    player.playerOneShip.shape:moveTo(player.playerOneShip.position.x,player.playerOneShip.position.y)
    player.playerOneShip.shape:setRotation(player.playerOneShip.rotation+3*math.pi/2)
    player.playerOneShip.thrustshape:moveTo(player.playerOneShip.position.x+math.cos(player.playerOneShip.rotation)*-12.5,player.playerOneShip.position.y+math.sin(player.playerOneShip.rotation)*-12.5)
    player.playerOneShip.thrustshape:setRotation(player.playerOneShip.rotation+3*math.pi/2)
end

function player.draw()
    player.playerOneShip:draw()
end

return player
