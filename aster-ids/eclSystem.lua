eclSystem = {}

function eclSystem.load()
	print("ECL Stuff")
end

return eclSystem

--[[
logicSystem = {}						-- Namespace for the logicSystem.lua file
logics = {}								-- Namespace for logics to exist in

---- Logic Vars ----
logicSystem.dir = "polyvoid/logics/"	-- Location of logic directory
logicSystem.filelist = {}				-- List of files in the logic directory
logicSystem.list = {}					-- List of logics that have been successfully loaded
logicSystem.hooks = {}					-- List of logic hooks (multi-logics variables)
logicSystem.callbacks = {} 				-- Logics with callback functions
logicSystem.callbacks.load = {} 		-- List of logics with load callback
logicSystem.callbacks.update = {} 		-- List of logics with update callback
logicSystem.callbacks.draw = {} 		-- List of logics with draw callback
logicSystem.callbacks.keypressed = {} 	-- List of logics with keypressed callback
logicSystem.callbacks.keyreleased = {} 	-- List of logics with keyreleased callback
logicSystem.callbacks.focus = {} 		-- List of logics with focus callback
logicSystem.callbacks.quit = {} 		-- List of logics with quit callback

function logicSystem.load()
	-- Load logics from filesystem
	logicSystem.filelist = love.filesystem.getDirectoryItems(logicSystem.dir)
	for num,filename in pairs(logicSystem.filelist) do
		local logicfile = logicSystem.filelist[num]
		if logicfile then
			if polyvoid.debug then
				print("Logic "..logicfile.." loading...")
			end

			-- Load this logic into our list of logics
			logicSystem.list[num] = dofile(logicSystem.dir..logicfile)

			-- If this logic has any hooks
			if logicSystem.list[num].hooks then
				-- Attempt to add this logic's hooks into our list of accessible hooks
				for num2,hook in pairs(logicSystem.list[num].hooks) do
					local newHook = logicSystem.list[num].hooks[num2]
					-- If this hook isn't already in our list
					if not tables.tableValueExists(logicSystem.hooks,newHook) then
						-- Add it to the list!
						logicSystem.hooks[#logicSystem.hooks+1] = newHook
						if polyvoid.debug then
							print("Systems hook "..newHook.." initialized.")
						end
					else
						if polyvoid.debug then
							print("Systems hook "..newHook.." already exists!")
						end
					end
				end
			end

			-- Check this logic for any callback functions
			if logicSystem.list[num].load then
				logicSystem.callbacks.load[#logicSystem.callbacks.load+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'load' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].update then
				logicSystem.callbacks.update[#logicSystem.callbacks.update+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'update' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].draw then
				logicSystem.callbacks.draw[#logicSystem.callbacks.draw+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'draw' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].keypressed then
				logicSystem.callbacks.keypressed[#logicSystem.callbacks.keypressed+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'keypressed' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].keyreleased then
				logicSystem.callbacks.keyreleased[#logicSystem.callbacks.keyreleased+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'keyreleased' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].focus then
				logicSystem.callbacks.focus[#logicSystem.callbacks.focus+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'focus' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if logicSystem.list[num].quit then
				logicSystem.callbacks.quit[#logicSystem.callbacks.quit+1] = logicSystem.list[num]
				if polyvoid.debug then
					print("Callback function 'quit' registered in '"..logicSystem.list[num].name.."' logic.")
				end
			end
			if polyvoid.debug then
				print("Logic "..logicfile.." loaded.")
			end
		else
			print("Logic "..filename.." failed to load.") -- Somehow this happened without causing a syntax error, there's probably something wrong with lua / the operating system
		end
	end
	-- Run load callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.load) do
		logic.load()
	end
end

function logicSystem.update(dt)
	-- Run update callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.update) do
		logic.update(dt)
	end
end

function logicSystem.draw()
	-- Run draw callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.draw) do
		logic.draw()
	end
end

function logicSystem.keypressed(key)
	-- Run keypressed callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.keypressed) do
		logic.keypressed(key)
	end
end

function logicSystem.keyreleased(key)
	-- Run keyreleased callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.keyreleased) do
		logic.keyreleased(key)
	end
end

function logicSystem.focus(focus)
	-- Run focus callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.focus) do
		logic.focus(focus)
	end
end

function logicSystem.quit()
	-- Run quit callback for logics that have it
	for num,logic in pairs(logicSystem.callbacks.quit) do
		logic.quit()
	end
end
]]

--[[
componentSystem = {}							-- Namespace for the componentSystem.lua file
components = {}									-- Namespace for components to exist in

---- Component Vars ----
componentSystem.dir = "polyvoid/components/"	-- Location of component directory
componentSystem.filelist = {}					-- List of files in the component directory
componentSystem.list = {}						-- List of components that have been successfully loaded

function componentSystem.load()
	-- Load components from filesystem
	componentSystem.filelist = love.filesystem.getDirectoryItems(componentSystem.dir)
	for num,filename in pairs(componentSystem.filelist) do
		local componentfile = componentSystem.filelist[num]
		if componentfile then
			-- Load this component into our list of components
			componentSystem.list[num] = dofile(componentSystem.dir..componentfile)
			if polyvoid.debug then
				print("Component "..componentfile.." loaded.")
			end
		else
			print("Component "..filename.." failed to load.") -- Somehow this happened without causing a syntax error, there's probably something wrong with lua / the operating system
		end
	end
end
]]