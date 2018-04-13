local Class = require("lib/middleclass")
local Vector2 = require("lib/Vector2")

local TileMaps = {}
TileMaps._index = TileMaps


function TileMaps:new()
  local self = setmetatable({}, TileMaps)
  self.arrayLoc = 0
  self.key = {}
  self.dataType = {}

  return self
end

function TileMaps:add(self, k, d)
  self.arrayLoc = self.arrayLoc + 1
  self.key[self.arrayLoc] = k
  self.dataType[self.arrayLoc] = d
end



function TileMaps:onTile(self, tileLoc, player)
  loc = 0
  for i = 1, table.getn(self.key), 1 do
    if (tileLoc == self.key[i]) then
      loc = i
    end
  end
  nEmptyTile = table.getn(self.dataType[loc]) + 1
  self.dataType[loc][nEmptyTile + 1] = player
end

function TileMaps:offTile(self, tileLoc, player)
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
