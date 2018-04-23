--[[ Purpose: The purpose of this class is to imitate a Maps function
     like the one in C++. This class is needed to keep track of all locations
     of one specific tile within a map and have functions that can be used to add
     players on to a tile and functions that can remove player from a tile on to
     another tile. \

     Just like the C++ Maps reference, TileMaps will contain parallel arrays one being
     used for the key and the other as the dataType. The arrayLoc will be used to keep track
     of how many arrays there are in the TileMaps class.

]]

local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local TileMaps = {}
TileMaps._index = TileMaps


function TileMaps:new()
  local self = setmetatable({}, TileMaps)
  self.arrayLoc = 0

  -- contains the location of the tile
  self.key = {}

  -- contains the list of players on the location of the tile
  -- in other words the dataType will be an array of all the players in the tile
  self.dataType = {}

  return self
end

function TileMaps:addTileLoc(self, tileLoc)
  self.arrayLoc = self.arrayLoc + 1
  self.key[self.arrayLoc] = tileLoc
  self.dataType[self.arrayLoc] = {n=6}
end


--[[
function TileMaps:add(self, k, d)
  self.arrayLoc = self.arrayLoc + 1
  self.key[self.arrayLoc] = k
  self.dataType[self.arrayLoc] = d
end
]]

--[[ Purpose: This function is for adding a player on a specific tile

]]

function TileMaps:addPlayerOnTile(self, tileLoc, player)
  loc = 0
  for i = 1, table.getn(self.key), 1 do
    if (tileLoc == self.key[i]) then
      loc = i
    end
  end
  nEmptyTile = table.getn(self.dataType[loc]) + 1
  self.dataType[loc][nEmptyTile + 1] = player
end

function TileMaps:removePlayerOnTile(self, tileLoc, player)
  loc = 0
  locPlayer = 0
  for i = 1, table.getn(self.key), 1 do
    if (tileLoc == self.key[i]) then
      loc = i
    end
  end
  for j = 1, table.getn(self.dataType[loc]), 1 do
    if player.getLabel == self.dataType[loc][j].getLabel then
      locPlayer = j
    end
  end
  table.remove(self.dataType[loc], locPlayer)
end

return TileMaps
