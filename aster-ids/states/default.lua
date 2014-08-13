default = {}

function default:enter()
	default.font = love.graphics.setNewFont(20)
	timer:add(3000,stateSystem.switch(menu)) -- Figure out how to do this properly
end

function default:draw()
	love.graphics.print("ASTERÖIDS",love.graphics.getWidth()/2,love.graphics.getHeight()/2,0,1,1,menu.font:getWidth("ASTER-IDS")/2,menu.font:getHeight("ASTER-IDS")/2)
end

return default