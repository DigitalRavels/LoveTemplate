local LIP = {};

--- Lua INI Parser Object
--- Requireing Creates a new Instance of LIP
--- @return table parser returns an instance on the ini parser
function LIP:new()
    local parser = {}
    setmetatable(parser, self)
    self.__index = self

	--- load ini file from provided path
	--- @param fileName string path to load file
	--- @return table config data loaded from ini
    self.load = function(fileName)
		assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
		local file = assert(io.open(fileName, 'r'), 'Error loading file : ' .. fileName);
		local data = {};
		local section;
		for line in file:lines() do
			local tempSection = line:match('^%[([^%[%]]+)%]$');
			if(tempSection)then
				section = tonumber(tempSection) and tonumber(tempSection) or tempSection;
				data[section] = data[section] or {};
			end
			local param, value = line:match('^([%w|_]+)%s-=%s-(.+)$');
			if(param and value ~= nil)then
				if(tonumber(value))then
					value = tonumber(value);
				elseif(value == 'true')then
					value = true;
				elseif(value == 'false')then
					value = false;
				end
				if(tonumber(param))then
					param = tonumber(param);
				end
				data[section][param] = value;
			end
		end
		file:close();
		return data;
    end

	--- saves files as ini at provided path
	--- @param fileName string path to save file
	--- @param data table data to save to ini
	self.save = function(fileName, data)
		assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
		assert(type(data) == 'table', 'Parameter "data" must be a table.');
		local file = assert(io.open(fileName, 'w+b'), 'Error loading file :' .. fileName);
		local contents = '';
		for section, param in pairs(data) do
			contents = contents .. ('[%s]\n'):format(section);
			for key, value in pairs(param) do
				contents = contents .. ('%s=%s\n'):format(key, tostring(value));
			end
			contents = contents .. '\n';
		end
		file:write(contents);
		file:close();
	end

    return parser
end

return LIP:new();