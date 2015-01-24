-- System Setup --
states = {}
states.string = "states"

-- Variables --
states.states = {}
states.currentState = {}

-- Functions --
function states.changeState(newState)
    local successIndictor = false
    for key,state in pairs(states.states) do
        if state.string == newState then
            if states.currentState.stateExit then states.currentState.stateExit() end
            states.currentState = state
            if states.currentState.stateEntry then states.currentState.stateEntry() end
            successIndictor = true
        end
    end
    if not successIndictor then
        error("State '"..newState.."' does not exist!")
    end
end

-- Callbacks --
function states.load()
    -- Loading game states --
    local statesDir = love.filesystem.getDirectoryItems("/states")
    for key,statefile in pairs(statesDir) do
        if string.find(statefile,".lua") then
            local statekey = string.gsub(statefile,".lua","") -- Remove .lua extension
            --debug("Loading: state "..statefile.." as "..statekey.."... ",true)
            states.states[statekey] = require("states."..statekey)
        end
    end

    -- Start game in menu state --
    states.changeState("menu")
end

function states.update(dt)
    if states.currentState.update then
        states.currentState.update(dt)
    end
end

function states.draw()
    if states.currentState.draw then
        states.currentState.draw()
    end
end

function states.mousepressed(x,y,button)
    if states.currentState.mousepressed then
        states.currentState.mousepressed(x,y,button)
    end
end

function states.mousereleased(x,y,button)
    if states.currentState.mousereleased then
        states.currentState.mousereleased(x,y,button)
    end
end

function states.mousefocus(focus)
    if states.currentState.mousefocus then
        states.currentState.mousefocus(focus)
    end
end

function states.keypressed(key,isrepeat)
    if states.currentState.keypressed then
        states.currentState.keypressed(key,isrepeat)
    end
end

function states.keyreleased(key)
    if states.currentState.keyreleased then
        states.currentState.keyreleased(key)
    end
end

function states.textinput(text)
    if states.currentState.textinput then
        states.currentState.textinput(text)
    end
end

function states.focus(focus)
    if states.currentState.focus then
        states.currentState.focus(focus)
    end
end

function states.visible(visible)
    if states.currentState.visible then
        states.currentState.visible(visible)
    end
end

function states.resize(w,h)
    if states.currentState.resize then
        states.currentState.resize(w,h)
    end
end

function states.quit()
    if states.currentState.quit then
        states.currentState.quit()
    end
end

return states
