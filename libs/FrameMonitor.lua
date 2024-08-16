--- FrameMonitor - Frame Monitoring Overlay for Debug
--- @class FrameMonitor Frame Monitoring Overlay for Debug
--- @field Overlay boolean Frame Monitoring Overlay Status - Current Visibility Status of Frame Monitoring Overlay
--- @field FrameRate number Frame Rate - Average Number of Frames Rendered Over the Last Second
--- @field FrameNumber number Frame Number - Number of Frames Rendered Since App Launch
local FrameMonitor = {
    Overlay = false,
    FrameRate = 0,
    FrameNumber = 0
}

--- Update the Information Provided to the Frame Monitor Overlay
--- @param dt number Delta Time - Time to Render Last Frame in Milliseconds
function FrameMonitor.update(dt)
    FrameMonitor.dt = dt;
    FrameMonitor.FrameRate = math.floor( 1 / FrameMonitor.dt );
    FrameMonitor.FrameNumber = FrameMonitor.FrameNumber + 1;
end

--- Enable Frame Monitor Overlay
function FrameMonitor.enableOverlay()
    FrameMonitor.Overlay = true;
end

--- Disable Frame Monitor Overlay
function FrameMonitor.disableOverlay()
    FrameMonitor.Overlay = false;
end

--- Toggle Display State of the Frame Monitor Overlay
function FrameMonitor.toggleOverlay()
    if FrameMonitor.Overlay then
        FrameMonitor.Overlay = false
    else
        FrameMonitor.Overlay = true;
    end
end

--- Draw The Frame Monitor Overlay on the Screen - Top Left
function FrameMonitor.draw()
    if (FrameMonitor.Overlay == true) then
        love.graphics.setColor( 0.5, 0.75, 1, 1 )
        love.graphics.rectangle("fill", 10, 10, 200, 50)
        love.graphics.setColor( 1, 1, 1, 1 )
        love.graphics.rectangle("line", 10, 10, 200, 50)
        love.graphics.setColor( 0, 0.075, 0.150, 1 )
        love.graphics.print( "Total Frames: " .. tostring(FrameMonitor.FrameNumber), 15, 12)
        love.graphics.print( "Frame Rate: " ..  tostring(FrameMonitor.FrameRate), 15, 27)
    end
end


return FrameMonitor