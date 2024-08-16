Debug = require 'libs/Debug';
FrameMonitor = require 'libs/FrameMonitor';
FileManager = require 'libs/FileManager';


--- Main Load Function For Love2d - Runs at Application Start
function love.load()
    FrameMonitor.enableOverlay()
    
end

--- Main Data Update Function For Love2d - Runs at the Start Of Each Frame - Runs Once Per Frame 
--- @param dt number Delta Time - Time to Render Last Frame in Milliseconds
function love.update(dt)
    FrameMonitor.update(dt);

end

--- Main Draw Function For Love2d - Runs Directly after love.update - Runs Once Per Frame
function love.draw()
    FrameMonitor.draw();

end

