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
TileMaps.__index = TileMaps


function TileMaps:new()
  local self = setmetatable({}, TileMaps)
  self.arrayLoc = 0

  -- contains the location of the tile
  self.key = {}

  -- contains the list of players on the location of the tile
  -- in other words the dataType will be an array of all the players in the tile
  self.dataType = {}
  self.numOfPlayers = {}

  return self
end

function TileMaps:addTileLoc(self, tileLoc )
  self.arrayLoc = self.arrayLoc + 1
  --print("Tiles are being added at location:" , self.arrayLoc )
  self.key[self.arrayLoc] = tileLoc
  self.dataType[self.arrayLoc] = {n=6}
  self.numOfPlayers[self.arrayLoc] = 0

  --print("there are " ,table.getn(self.key), " objects in the table")
  --print("")
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
  --print(table.getn(self.key))

  if (table.getn(self.key) > 1) then
  for i = 1, table.getn(self.key), 1 do
    print("")
    --print("Tile in the function", tileLoc:getX(), tileLoc:getY())
  --  print(i, self.key[i]:getX(), self.key[i]:getY())
    if (tileLoc:getX() == self.key[i]:getX()) then
      if(tileLoc:getY() == self.key[i]:getY()) then
      --  print("ASDASD")
        loc = i
      end
    end
  end
else
  loc = 1
end



  self.numOfPlayers[loc] = self.numOfPlayers[loc] + 1
  self.dataType[loc][self.numOfPlayers[loc]] = player

end

function TileMaps:removePlayerOnTile(self, tileLoc, player)
  --print("GOES THROUGH HERES")
  loc = 0
  locPlayer = 0
  if (table.getn(self.key) > 1) then
  for i = 1, table.getn(self.key), 1 do
    if (tileLoc:getX() == self.key[i]:getX()) then
      if(tileLoc:getY() == self.key[i]:getY()) then
        loc = i
      end
    end
  end
else
  loc = 1
end

  print(table.getn(self.dataType[loc]))
  for j = 1, table.getn(self.dataType[loc]), 1 do
    --print("Player label: ",player:getLabel(player), "Compare Label: ", )
    if (player:getLabel(player) == self.dataType[loc][j]:getLabel(self.dataType[loc][j])) then
      locPlayer = j
    end
  end


  print("location of Player: ", locPlayer)

  table.remove(self.dataType[loc], locPlayer)
  self.numOfPlayers[loc] = self.numOfPlayers[loc] - 1
end

function TileMaps:drawPlayers(self)
  for i = 1, table.getn(self.key), 1 do
    if self.numOfPlayers[i] == 1 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 30 , self.key[i]:getY() + 30 , 9)
      love.graphics.setColor(255,255,255,255)
    end

    if self.numOfPlayers[i] == 2 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 15 , self.key[i]:getY() + 30 , 9)

      love.graphics.setColor(self.dataType[i][2]:getR(self.dataType[i][2]),self.dataType[i][2]:getG(self.dataType[i][2]),self.dataType[i][2]:getB(self.dataType[i][2]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 45 , self.key[i]:getY() + 30 , 9)
      love.graphics.setColor(255,255,255,255)
    end

    if self.numOfPlayers[i] == 3 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 10 , self.key[i]:getY() + 30 , 9)

      love.graphics.setColor(self.dataType[i][2]:getR(self.dataType[i][2]),self.dataType[i][2]:getG(self.dataType[i][2]),self.dataType[i][2]:getB(self.dataType[i][2]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 30 , self.key[i]:getY() + 30 , 9)

      love.graphics.setColor(self.dataType[i][3]:getR(self.dataType[i][3]),self.dataType[i][3]:getG(self.dataType[i][3]),self.dataType[i][3]:getB(self.dataType[i][3]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 50 , self.key[i]:getY() + 30 , 9)
      love.graphics.setColor(255,255,255,255)
    end

    if self.numOfPlayers[i] == 4 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 15 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][2]:getR(self.dataType[i][2]),self.dataType[i][2]:getG(self.dataType[i][2]),self.dataType[i][2]:getB(self.dataType[i][2]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 45 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][3]:getR(self.dataType[i][3]),self.dataType[i][3]:getG(self.dataType[i][3]),self.dataType[i][3]:getB(self.dataType[i][3]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 15 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(self.dataType[i][4]:getR(self.dataType[i][4]),self.dataType[i][4]:getG(self.dataType[i][4]),self.dataType[i][4]:getB(self.dataType[i][4]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 45 , self.key[i]:getY() + 45 , 9)
      love.graphics.setColor(255,255,255,255)
    end

    if self.numOfPlayers[i] == 5 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 15 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][2]:getR(self.dataType[i][2]),self.dataType[i][2]:getG(self.dataType[i][2]),self.dataType[i][2]:getB(self.dataType[i][2]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 45 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][3]:getR(self.dataType[i][3]),self.dataType[i][3]:getG(self.dataType[i][3]),self.dataType[i][3]:getB(self.dataType[i][3]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 15 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(self.dataType[i][4]:getR(self.dataType[i][4]),self.dataType[i][4]:getG(self.dataType[i][4]),self.dataType[i][4]:getB(self.dataType[i][4]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 45 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(self.dataType[i][5]:getR(self.dataType[i][5]),self.dataType[i][5]:getG(self.dataType[i][5]),self.dataType[i][5]:getB(self.dataType[i][5]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 30 , self.key[i]:getY() + 30 , 9)
      love.graphics.setColor(255,255,255,255)
    end

    if self.numOfPlayers[i] == 6 then
      love.graphics.setColor(self.dataType[i][1]:getR(self.dataType[i][1]),self.dataType[i][1]:getG(self.dataType[i][1]),self.dataType[i][1]:getB(self.dataType[i][1]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 10 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][2]:getR(self.dataType[i][2]),self.dataType[i][2]:getG(self.dataType[i][2]),self.dataType[i][2]:getB(self.dataType[i][2]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 30 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][3]:getR(self.dataType[i][3]),self.dataType[i][3]:getG(self.dataType[i][3]),self.dataType[i][3]:getB(self.dataType[i][3]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 50 , self.key[i]:getY() + 15 , 9)

      love.graphics.setColor(self.dataType[i][4]:getR(self.dataType[i][4]),self.dataType[i][4]:getG(self.dataType[i][4]),self.dataType[i][4]:getB(self.dataType[i][4]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 10 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(self.dataType[i][5]:getR(self.dataType[i][5]),self.dataType[i][5]:getG(self.dataType[i][5]),self.dataType[i][5]:getB(self.dataType[i][5]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 30 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(self.dataType[i][6]:getR(self.dataType[i][6]),self.dataType[i][6]:getG(self.dataType[i][6]),self.dataType[i][6]:getB(self.dataType[i][6]), 255)
      love.graphics.circle("fill", self.key[i]:getX() + 50 , self.key[i]:getY() + 45 , 9)

      love.graphics.setColor(255,255,255,255)
    end
  end
end


return TileMaps
