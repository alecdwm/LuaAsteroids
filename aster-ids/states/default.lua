default = {}

function default:enter()
	love.graphics.setBackgroundColor(0,0,0)
	default.font = love.graphics.setNewFont(20)
	timer.add(2,function() stateSystem.switch(menu) end)
end

function default:update(dt)
	timer.update(dt)
end

function default:draw()
	love.graphics.print("ASTERÖIDS",love.graphics.getWidth()/2,love.graphics.getHeight()/2-15,0,1,1,default.font:getWidth("ASTER-IDS")/2,default.font:getHeight("ASTER-IDS")/2)
	love.graphics.print("By Jasper & Alec",love.graphics.getWidth()/2,love.graphics.getHeight()/2+10,0,1,1,default.font:getWidth("By Alec & Jasper")/2,default.font:getHeight("By Alec & Jasper")/2)
end

return default