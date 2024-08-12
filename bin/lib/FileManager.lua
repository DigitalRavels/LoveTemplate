local FileManager = {};

--- File Manager - class for managing file parsers
--- @return table manager returns an instance of File manager
function FileManager:new()
	local manager = {}
	setmetatable(manager, self)
	self.__index = self

	self.ini = require 'bin/lib/LIP';

	return manager;
end

return FileManager:new();