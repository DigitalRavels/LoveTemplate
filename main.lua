
Frames = require 'bin/lib/FrameMonitor';
Debug = require 'bin/lib/Debug';
FM = require 'bin/lib/FileManager';

function love.load()
    Frames.enableOverlay()
end

function love.update(dt)
    Frames.update(dt);
end

function love.draw()
    Frames.draw();


end

