local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local PlayerGUI = {}
PlayerGUI.__index = PlayerGUI

local function color(r,g,b,a)
	return {r,g or r, b or r, a or 255}
end

local function gray(level,alpha)
	return {level,level,level,alpha or 255}
end

local function mouse_inbounds(self,mx,my) -- checks to see if the cursor is within the PlayerGUI bounds
	return (mx >= self:getPosX(self) and mx <= self:getPosX(self) + self.w) and
		   (my >= self:getPosY(self) and my <= self:getPosY(self) + self.h)
end

function PlayerGUI:new(x,y,w,h,label) -- Think of this as constructor
	local self = setmetatable({}, PlayerGUI)
	self.pos = Vector2:new(x or 0, y or 0) -- x and y position for the GUI of a player and maybe moved to its own class
	self.w = w -- width for GUI of player, should be fixed value and maybe moved to its own class
	self.h = h -- height for GUI of player, should be fixed value and maybe moved to its own class
	self.label = label -- Name of the associated Player/Group to the GUI
	return self
end

function PlayerGUI:clickedEvent(self,mx,my)
	if mouse_inbounds(self,mx,my) then 
		print(self.label.." was clicked")
	end
end

function PlayerGUI:isHovered(self,mx,my) -- acts as draw, color when hovered vs color when not hovered
	if mouse_inbounds(self,mx,my) then 
		
		print(self.label.." is being hovered")
	else
		love.graphics.setColor(128,128,128,255)
		love.graphics.rectangle("fill",self:getPosX(self),self:getPosY(self),self.w,self.h)
		love.graphics.setColor(255,255,255,255)
	end
end

function PlayerGUI:getPosX(self)
	return self.pos:getX()
end

function PlayerGUI:getPosY(self)
	return self.pos:getY()
end

function PlayerGUI:getLabel(self)
	return self.label
end

return PlayerGUI