local FrameMonitor = {}

--- FrameMonitor - a tool used for monitoring framerate on love.2d applications
--- @return table FrameMonitor returns an instance of Frame Monitor
function FrameMonitor:new()
    local monitor = {}
    setmetatable(monitor, self)
    self.__index = self

    self.Overlay = false
    self.dt = 0
    self.FrameRate = 0
    self.FrameNumber = 0

    --- Updates the information provided to the overlay
    --- @param dt number Delta Time provided by love.update
    self.update = function(dt)
        self.dt = dt;
        self.FrameRate = math.floor( 1 / self.dt );
        self.FrameNumber = self.FrameNumber + 1;
    end

    --- enable display overlay
    self.enableOverlay = function()
        self.Overlay = true;
    end

    --- disable display overlay
    self.disableOverlay = function()
        self.Overlay = false;
    end

    --- toggle visability of display overlay
    self.toggleOverlay = function()
        if self.Overlay then
            self.Overlay = false
        else
            self.Overlay = true;
        end
    end

    --- draw fram monitor overlay on screen
    self.draw = function()
        if (self.Overlay == true) then
            love.graphics.setColor( 0.5, 0.75, 1, 1 )
            love.graphics.rectangle("fill", 10, 10, 200, 50)
            love.graphics.setColor( 1, 1, 1, 1 )
            love.graphics.rectangle("line", 10, 10, 200, 50)
            love.graphics.setColor( 0, 0.075, 0.150, 1 )
            love.graphics.print( "Total Frames: " .. tostring(self.FrameNumber), 15, 12)
            love.graphics.print( "Frame Rate: " ..  tostring(self.FrameRate), 15, 27)
        end
    end

    return monitor
end


return FrameMonitor:new();