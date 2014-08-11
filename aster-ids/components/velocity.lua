local class = require "libraries.hump.class"
local vector = require "libraries.hump.vector"

velocity = class{}

function velocity:init(vel)
	self.velocity = vel or vector(0,0)
end

function velocity:setVelocity(vel)
	self.velocity = vel or vector(0,0)
end

function velocity:getVelocity()
	return self.velocity
end