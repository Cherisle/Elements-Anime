local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")
local TileMaps = require "TileMaps"

local Tile = {}
Tile.__index = Tile

local function mouse_inbounds(self,mx,my,loc)
  return  (mx >= self:getPosX(self, loc) and mx <= self:getPosX(self, loc) + self.tileWidth) and
		   (my >= self:getPosY(self, loc) and my <= self:getPosY(self, loc) + self.tileHeight)
end

--[[ Purpose: Think of this function as a constructor
@param row - Row location of the tile
@param col - Column location of the tile
@param image - Image file of the tile
@param active - Boolean variable representing if tile is active or not
]]
function Tile:new(image, active, name)
  local self = setmetatable({}, Tile)
  self.isActive = active
  self.tileImage = image
  self.label = name
  self.tileWidth = 60
  self.tileHeight = 60
  self.tileMap = TileMaps:new()
  --self.pos = Vector2:new(0,0)
  self.tileLoc = {}

  return self

end

function Tile:getImage(self)
  return self.tileImage
end

-- Use for loop to go through the list of position a tile can possibly have
-- then run if statement to check if in bounds
function Tile:isHovered(self,mx,my)
  for i = 1, table.getn(self.tileLoc),1 do
    if mouse_inbounds(self, mx, my, i) then
        print(self.label.." tile is being hovered")
      end
    end

  end

  function Tile:clikedEvent(self, mx,my)
    for i = 1, table.getn(self.tileLoc),1 do
      if mouse_inbounds(self, mx,my,i) then
        print(self.label.. " panel was pressed" )
      end
    end
  end

function Tile:setTileLoc(self, arrayNum, xLoc, yLoc)
  self.tileLoc[arrayNum] = Vector2:new(xLoc or 0, yLoc or 0)
  
end

function Tile:getPosX(self, loc)
  return self.tileLoc[loc]:getX()
  --return self.pos:getX()
end

function Tile:getPosY(self, loc)
  return self.tileLoc[loc]:getY()
  --return self.pos:getY()
end

--[[
function Tile:playerLandsOnTile(self, player, place)
  self.playerOnTile[place] = player
end

function Tile:playerLeavesTile(self, player)
  for i = 1, table.getn(self.playerOnTile), 1 do
]]--


--[[
function Tile:setPos(self, getX, getY)
  self.pos:setPos(getX, getY)
end

function Tile:setPosX(self, posX)
  self.pos:setX(posX)
end

function Tile:setPosY(self,posY)
  self.pos:setY(posY)
end
]]--

function Tile:getLabel(self)
  return self.getLabel
end

return Tile
