require "scenery"
ui = require "loveui/ui"
local PlayerGUI = require "PlayerGUI"
local Player = require "Player"
local context = ui.context()

s = {}
function s.load()
	love.window.setMode(0,0,{resizable = true,vsync = false}) 
	--setting the size to 0,0 will set it to the complete size of your screen
	Players = {n=6}
	Players[1] = Player:new("Team 1",0,0)
	Players[2] = Player:new("Team 2",0,0)
	Players[3] = Player:new("Team 3",0,0)
	Players[4] = Player:new("Team 4",0,0)
	Players[5] = Player:new("Team 5",0,0)
	Players[6] = Player:new("Team 6",0,0)
	PlayerGUIs = {n=6}
	PlayerGUIs[1] = PlayerGUI:new(50,50,250,250,Players[1]:getLabel(Players[1]))
	PlayerGUIs[2] = PlayerGUI:new(love.graphics.getWidth() - 300,50,250,250,Players[2]:getLabel(Players[2]))
	PlayerGUIs[3] = PlayerGUI:new(50,350,250,250,Players[3]:getLabel(Players[3]))
	PlayerGUIs[4] = PlayerGUI:new(love.graphics.getWidth() - 300,350,250,250,Players[4]:getLabel(Players[4]))
	PlayerGUIs[5] = PlayerGUI:new(50,650,250,250,Players[5]:getLabel(Players[5]))
	PlayerGUIs[6] = PlayerGUI:new(love.graphics.getWidth() - 300,650,250,250,Players[6]:getLabel(Players[6]))
	BG = love.graphics.newImage("Beachstorm.jpg")
	N = love.graphics.newImage("Normal Panel.png")
	MB = love.graphics.newImage("Movement Boost Panel.png")
	
	TileW, TileH = 60,60
	Tileset = love.graphics.newImage("TestQuads v3.png")
  
	local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	
	Quads = 
	{
		love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH), -- 1 = Movement Boost Panel
		love.graphics.newQuad(60,  0, TileW, TileH, tilesetW, tilesetH), -- 2 = Normal Panel
		love.graphics.newQuad(120, 0, TileW, TileH, tilesetW, tilesetH), -- 3 = Water
		love.graphics.newQuad(180, 0, TileW, TileH, tilesetW, tilesetH), -- 4 = Sand
		love.graphics.newQuad(0, 60, TileW, TileH, tilesetW, tilesetH), -- 5 = Sand UL Water BR
	}
	TileTable =
	{
     { 4,4,4,1,2,2,2,2,2,2,2,2,2,4,4 },
     { 4,4,1,2,1,4,4,4,4,4,1,1,1,1,4 },
     { 4,1,2,1,5,3,3,3,3,3,4,1,1,1,2 },
     { 1,2,1,5,3,3,3,3,3,3,3,4,1,1,2 },
     { 2,1,5,3,3,3,3,3,3,3,3,3,4,1,2 },
     { 2,5,3,3,3,3,3,3,3,3,3,3,3,4,2 },
     { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 },
     { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 },
     { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 },           
     { 2,4,3,3,3,3,3,3,3,3,3,3,3,4,2 },
     { 2,1,4,3,3,3,3,3,3,3,3,3,4,1,2 },
     { 2,1,1,4,3,3,3,3,3,3,3,4,1,1,2 },
     { 2,1,1,1,4,3,3,3,3,3,4,1,1,1,2 },
     { 4,1,1,1,1,4,4,4,4,4,1,1,1,1,4 },
     { 4,4,2,2,2,2,2,2,2,2,2,2,2,4,4 }
	}
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
end

function s.draw() 
	--love.graphics.draw(BG, love.graphics.getWidth()/2 - 450, love.graphics.getHeight()/2 - 450)
	for rowIndex=1, #TileTable do
		local row = TileTable[rowIndex]
		for columnIndex=1, #row do
			local number = row[columnIndex]
			local x = love.graphics.getWidth()/2 - 450 + (columnIndex-1)*TileW
			local y = love.graphics.getHeight()/2 - 450 + (rowIndex-1)*TileH
			love.graphics.draw(Tileset, Quads[number], x, y)
		end
	end
	PlayerGUIs[1]:isHovered(PlayerGUIs[1],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[2]:isHovered(PlayerGUIs[2],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[3]:isHovered(PlayerGUIs[3],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[4]:isHovered(PlayerGUIs[4],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[5]:isHovered(PlayerGUIs[5],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[6]:isHovered(PlayerGUIs[6],love.mouse.getX(),love.mouse.getY())
end

function s.update(dt)
	collectgarbage()
end

function love.mousepressed(x, y, button)
	if button == 2 then
		scenery.load("MainMenu")
    end
end

function love.resize(w,h)

end