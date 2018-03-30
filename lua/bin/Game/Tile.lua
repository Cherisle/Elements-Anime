local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local Tile = {}
Tile.__index = Tile

local function mouse_inbounders(self,mx,my)
  return  (mx >= self:getPosX(self) and mx <= self:getPosX(self) + self.w) and
		   (my >= self:getPosY(self) and my <= self:getPosY(self) + self.h)
end

--[[ Purpose: Think of this function as a constructor
@param row - Row location of the tile
@param col - Column location of the tile
@param image - Image file of the tile
@param active - Boolean variable representing if tile is active or not
]]
function Tile:new(image, active)
  local self = setmetatable({}, Tile)
  self.isActive = active
  self.tileImage = image
  self.playerOnTile = {}

  return self

end

function Tile:getImage(self)
  return self.tileImage
end

return Tile
