menu = {}

function menu:enter()
	menu.font = love.graphics.setNewFont(20)
end

function menu:draw()
	love.graphics.print("ASTERÖIDS",love.graphics.getWidth()/2,love.graphics.getHeight()/2-15,0,1,1,menu.font:getWidth("ASTER-IDS")/2,menu.font:getHeight("ASTER-IDS")/2)
	love.graphics.print("Press ENTER to Play",love.graphics.getWidth()/2,love.graphics.getHeight()/2+10,0,1,1,menu.font:getWidth("Press Enter to Play")/2,menu.font:getHeight("Press Enter to Play")/2)
end

function menu:keypressed(key)
	if key == "return" then
		gamestate.switch(game)
	end
	if key == "q" or key == "escape" then
		love.event.quit()
	end
end

return menu