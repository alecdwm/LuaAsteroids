function glowShape(r,g,b,type,...)
	love.graphics.setColor(r,g,b,15)
	for i=5,2,-1 do
		if i == 2 then
			i = 1
			love.graphics.setColor(r,g,b,255)
		end
		love.graphics.setLineWidth(i)
		if type == "line" then
			love.graphics[type](...)
		else
			love.graphics[type]("line",...)
		end
	end
end