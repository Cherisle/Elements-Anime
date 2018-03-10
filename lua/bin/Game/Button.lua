require "scenery"

local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local Button = {}
Button.__index = Button

local function color(r,g,b,a)
	return {r,g or r, b or r, a or 255}
end

local function gray(level,alpha)
	return {level,level,level,alpha or 255}
end

local function mouse_inbounds(self,mx,my)
	return (mx >= self:getPosX(self) and mx <= self:getPosX(self) + self.w) and
		   (my >= self:getPosY(self) and my <= self:getPosY(self) + self.h)
end

function Button:new(x,y,w,h,label) -- Think of this as constructor
	local self = setmetatable({}, Button)
	self.pos = Vector2:new(x or 0, y or 0)
	self.w = w
	self.h = h
	print(self.h)
	self.label = label
	
	--Button Colors
	self.normal = color(119,221,218,192)
	self.highlight = color(169,169,169,255)
	self.pressed = color(255,32,32,255)
	self.disabled = gray(128,128)
	return self
end

function Button:clickedEvent(self,mx,my)
	if mouse_inbounds(self,mx,my) then 
		if self:getLabel(self) == "Play" then 
			love.audio.stop()
			scenery.load("Play Button Scene")
		elseif self:getLabel(self) == "Quit Game" then 
			love.audio.stop()
			love.event.quit()
		elseif self:getLabel(self) == "Settings" then 
			print("Settings Button pressed")
		else   
			print("blah")
		end
	end
end

function Button:isHovered(self,mx,my)
	if mouse_inbounds(self,mx,my) then 
		local r,g,b,a = love.graphics.getColor()
		love.graphics.setColor(self:getClrHighlight(self))
		love.graphics.rectangle("fill", self:getPosX(self), self:getPosY(self), self.w, self.h)
		love.graphics.setColor(r,g,b,a)
		font = love.graphics.setNewFont("Square.ttf",32)
		love.graphics.print(self.label,self:getPosX(self) + self.w/2 - (font:getWidth(self.label)/2), self:getPosY(self) + self.h *0.29)
	else
		local r,g,b,a = love.graphics.getColor()
		love.graphics.setColor(self:getClrNormal(self))
		love.graphics.rectangle("fill", self:getPosX(self), self:getPosY(self), self.w, self.h)
		love.graphics.setColor(r,g,b,a)
		font = love.graphics.setNewFont("Square.ttf",32)
		love.graphics.print(self.label,self:getPosX(self) + self.w/2 - (font:getWidth(self.label)/2), self:getPosY(self) + self.h *0.29)
	end
end

function Button:setWidth(self,newWidth)
	self.w = newWidth
end

function Button:setHeight(self,newHeight)
	self.h = newHeight
end

function Button:getLabel(self)
	return self.label
end

function Button:getPosX(self)
	return self.pos:getX()
end

function Button:getPosY(self)
	return self.pos:getY()
end

function Button:getClrNormal(self)
	return self.normal
end

function Button:getClrHighlight(self)
	return self.highlight
end

return Button