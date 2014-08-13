transform = class{}

function transform:init(pos,rot)
	self.pos = pos or vector(0,0)
	self.rot = rot or 0
end

function transform:setTransform(pos,rot)
	self.pos = pos or vector(0,0)
	self.rot = rot or 0
end

function transform:getTransform()
	return self.pos,self.rot
end