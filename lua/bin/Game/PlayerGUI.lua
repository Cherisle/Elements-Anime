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

local function mouse_inboundsIMG(mx,my,imgPosX,imgPosY,imgW,imgH)
	return (mx >= imgPosX and mx <= (imgPosX + imgW)) and
		   (my >= imgPosY and my <= (imgPosY + imgH))
end


function PlayerGUI:new(x,y,w,h,label, player,r,g,b) -- Think of this as constructor
	local self = setmetatable({}, PlayerGUI)
	self.pos = Vector2:new(x or 0, y or 0) -- x and y position for the GUI of a player and maybe moved to its own class
	self.w = w -- width for GUI of player, should be fixed value and maybe moved to its own class
	self.h = h -- height for GUI of player, should be fixed value and maybe moved to its own class
	self.label = label -- Name of the associated Player/Group to the GUI
	self.player = player
	self.r = r
	self.g = g
	self.b = b
	self.moveButtonColor = 200
	self.locationFromTile = 0
	self.tileType = 0
	return self
end

function PlayerGUI:clickedEvent(self,mx,my)
	if mouse_inbounds(self,mx,my) then
		print(self.label.." was clicked")
	end
	return true
end

function PlayerGUI:isHovered(self,mx,my) -- acts as draw, color when hovered vs color when not hovered
	if mouse_inbounds(self,mx,my) then

		print(self.label.." is being hovered")
	--else
		--love.graphics.setColor(128,128,128,255)
		--love.graphics.rectangle("fill",self:getPosX(self),self:getPosY(self),self.w,self.h)
		--love.graphics.setColor(255,255,255,255)
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

function PlayerGUI:addHP(self)
	local img = love.graphics.newImage("Art Assets/black plus button.png")
	local imgW = img:getWidth()
	local imgH = img:getHeight()
	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 125, self:getPosY(self) + 205, imgW, imgH) then
			self.player:addHP(self.player, 1)
		end
end

function PlayerGUI:subtractHP(self)
	local img = love.graphics.newImage("Art Assets/black plus button.png")
	local imgW = img:getWidth()
	local imgH = img:getHeight()
	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 155, self:getPosY(self) + 205, imgW, imgH) then
			self.player:subtractHP(self.player, 1)
	end
end

function PlayerGUI:addAP(self)
	local img = love.graphics.newImage("Art Assets/black plus button.png")
	local imgW = img:getWidth()
	local imgH = img:getHeight()
	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 185, self:getPosY(self) + 205, imgW, imgH) then
		self.player:addAP(self.player, 1)
	end
end

function PlayerGUI:subtractAP(self)
	local img = love.graphics.newImage("Art Assets/black plus button.png")
	local imgW = img:getWidth()
	local imgH = img:getHeight()
	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 215, self:getPosY(self) + 205, imgW, imgH) then
		self.player:subtractAP(self.player, 1)
	end
end
--sdfdssgjsfsdf

function PlayerGUI:drawStatButton(self)
	local img = love.graphics.newImage("Art Assets/black plus button.png")
	local imgW = img:getWidth()
	local imgH = img:getHeight()

	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 125, self:getPosY(self) + 205, imgW, imgH) then
		love.graphics.draw(love.graphics.newImage("Art Assets/color plus button.png"), self:getPosX(self) + 125, self:getPosY(self) + 205)
	else
		love.graphics.draw(love.graphics.newImage("Art Assets/black plus button.png"), self:getPosX(self) + 125, self:getPosY(self) + 205)
	end

	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 155, self:getPosY(self) + 205, imgW, imgH) then
		love.graphics.draw(love.graphics.newImage("Art Assets/color minus button.png"), self:getPosX(self) + 155, self:getPosY(self) + 205)
	else
		love.graphics.draw(love.graphics.newImage("Art Assets/black minus button.png"), self:getPosX(self) + 155, self:getPosY(self) + 205)
	end

	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 185, self:getPosY(self) + 205, imgW, imgH) then
		love.graphics.draw(love.graphics.newImage("Art Assets/color plus button.png"), self:getPosX(self) + 185, self:getPosY(self) + 205)
	else
		love.graphics.draw(love.graphics.newImage("Art Assets/black plus button.png"), self:getPosX(self) + 185, self:getPosY(self) + 205)
	end

	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(), self:getPosX(self) + 215, self:getPosY(self) + 205, imgW, imgH) then
		love.graphics.draw(love.graphics.newImage("Art Assets/color minus button.png"), self:getPosX(self) + 215, self:getPosY(self) + 205)
	else
		love.graphics.draw(love.graphics.newImage("Art Assets/black minus button.png"), self:getPosX(self) + 215, self:getPosY(self) + 205)
	end



	love.graphics.setFont(font2)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("HP: ", self:getPosX(self) + 130, self:getPosY(self) + 180)
	love.graphics.print("AP: ", self:getPosX(self) + 190, self:getPosY(self) + 180)
	love.graphics.setColor(255,255,255,255)
end

function PlayerGUI:moveEvent(self)

	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(),self:getPosX(self) + 15, self:getPosY(self) + 200 ,self.w/ 2.5, 35) then
		self.moveButtonColor = 255
		--print("goes through here")
		return true
	end


end

function PlayerGUI:drawMoveButton(self)
	love.graphics.setFont(font4)
	if mouse_inboundsIMG(love.mouse.getX(), love.mouse.getY(),self:getPosX(self) + 15, self:getPosY(self) + 200 ,self.w/ 2.5, 35) then
		love.graphics.setColor(255,255,255,255)
		love.graphics.rectangle("fill",self:getPosX(self) + 15,self:getPosY(self) + 200 ,self.w/ 2.5, 35)
		love.graphics.setColor(0,0,0,255)
	else
		love.graphics.setColor(self.moveButtonColor,255,255,255)
		love.graphics.rectangle("fill",self:getPosX(self) + 15,self:getPosY(self) + 200 ,self.w/ 2.5, 35)
		love.graphics.setColor(0,0,0,255)
	end
	love.graphics.print("MOVE", self:getPosX(self) + 15 + ((self.w/ 2.5)/2) - (font4:getWidth("MOVE")/2), self:getPosY(self) + 205)
	love.graphics.setColor(255,255,255,255)
end


function PlayerGUI:drawPlayer(self)
	font1 = love.graphics.setNewFont("Brushy_Cre.ttf",32)
	font2 = love.graphics.setNewFont("Brushaff.otf",22)
	font3 = love.graphics.setNewFont("Brushy_Cre.ttf",18)
	font4 = love.graphics.setNewFont("Brushy_Cre.ttf",28)

	love.graphics.setColor(128,128,128,255)
  love.graphics.rectangle("fill",self:getPosX(self),self:getPosY(self),self.w,self.h)
	love.graphics.setColor(200,255,255,255)
	love.graphics.rectangle("fill",self:getPosX(self),self:getPosY(self),self.w, 40)

	-- Draws Team Name
	love.graphics.setFont(font1)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print(self.label,self:getPosX(self)  + (self.w/2) - (font1:getWidth(self.label)/2), self:getPosY(self) + 5)
	love.graphics.setColor(255,255,255,255)

	-- Draw HP and AP
	love.graphics.setFont(font2)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("HP: ", self:getPosX(self) + 15, self:getPosY(self) + 60)
	love.graphics.print("AP: ", self:getPosX(self) + 15, self:getPosY(self) + 90)
	love.graphics.setColor(255,255,255,255)

  -- Draws HP and AP number box
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill",self:getPosX(self) + (font2:getWidth("HP: ")) + 20,self:getPosY(self) + 64 ,self.w/3, 20)
	love.graphics.rectangle("fill",self:getPosX(self) + (font2:getWidth("HP: ")) + 20,self:getPosY(self) + 94 ,self.w/3, 20)
	love.graphics.setColor(255,255,255,255)

	-- Draws HP and AP numbers
	love.graphics.setFont(font3)
	love.graphics.setColor(0,0,0,255)
	love.graphics.print(self.player:getHP(self.player), self:getPosX(self) + (font2:getWidth("HP: ")) + 20 + ((self.w/3)/2) - (font3:getWidth(self.player:getHP(self.player))/2) , self:getPosY(self) + 67)
	love.graphics.print(self.player:getAP(self.player), self:getPosX(self) + (font2:getWidth("HP: ")) + 20 + ((self.w/3)/2) - (font3:getWidth(self.player:getAP(self.player))/2) , self:getPosY(self) + 97)
	love.graphics.setColor(255,255,255,255)

	-- Draws the MOVE button

	PlayerGUI:drawMoveButton(self)

	PlayerGUI:drawStatButton(self)

	love.graphics.setColor(self.r, self.g, self.b, 255)
	love.graphics.circle("fill", self:getPosX(self) + 195, self:getPosY(self) + 90, 20)
	love.graphics.setColor(255,255,255,255)
end

function PlayerGUI:getR(self)
	return self.r
end

function PlayerGUI:getG(self)
	return self.g
end

function PlayerGUI:getB(self)
	return self.b
end

function PlayerGUI:changeMoveColorBack(self)
	self.moveButtonColor = 200
end

function PlayerGUI:setTileLoc(self, l, t)
	self.locationFromTile = l
	self.tileType = t
end

function PlayerGUI:getTileLoc(self)
	return self.locationFromTile
end

function PlayerGUI:getTileType(self)
	return self.tileType
end

function PlayerGUI:setTileType(self, t)
	self.tileType = t
end

return PlayerGUI
