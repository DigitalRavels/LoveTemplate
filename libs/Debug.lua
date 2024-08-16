--- Debug Runner For VS Code
if arg[2] == "debug" then
    require("lldebugger").start()
    print("Debugging Enabled")
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    ---@diagnostic disable-next-line: undefined-global
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
