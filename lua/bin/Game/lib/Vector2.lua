local Class = require("lib/middleclass")

local Vec2 = {}
Vec2.__index = Vec2

function Vec2:new(x,y)
    local self = setmetatable({}, Vec2)
	self.x = x or 0
    self.y = y or 0
	return self
end

function Vec2:getX()
	return self.x
end

function Vec2:getY()
	return self.y
end

return Vec2