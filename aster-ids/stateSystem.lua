stateSystem = class{}
stateSystem.states = {}

stateSystem.dir = "aster-ids/states/"
stateSystem.filelist = {}
stateSystem.list = {}

function stateSystem.load()
	stateSystem.filelist = love.filesystem.getDirectoryItems(stateSystem.dir)
	for num,filename in pairs(stateSystem.filelist) do
		local stateFile = stateSystem.filelist[num]
		if stateFile then
			stateSystem.list[num] = dofile(stateSystem.dir..stateFile)
			if devspace.debug then
				print("State "..stateFile.." loaded.")
			end
		else
			if devspace.debug then
				print("State "..filename.." failed to load.") -- Somehow this happened without causing a syntax error, there's probably something wrong with lua / the operating system
			end
		end
	end

	gamestate.registerEvents()
	gamestate.switch(default)
end

function stateSystem.switch(state)
	gamestate.switch(state)
end

return stateSystem