local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local Player = {}
Player.__index = Player

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

function Player:new(label,row,col) -- Think of this as constructor
	local self = setmetatable({}, Player)
	self.hp = 15 -- default HP count of any new player
	self.ap = 0 -- default AnimePoint count of any new player
	self.label = label -- team name of the group
	
	self.r = row -- current row of TileMap player is on
	self.c = col -- current col of TileMap player is on
	return self
end

--[[function Player:clickedEvent(self,mx,my)
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
end]]

function Player:setHP(self,newHP)
	self.hp = newHP
end

function Player:setAP(self,newAP)
	self.ap = newAP
end

function Player:getLabel(self)
	return self.label
end

return Player