require "scenery"
ui = require "loveui/ui"
local PlayerGUI = require "PlayerGUI"
local Player = require "Player"
local Tile = require "Tile"
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
	--BG = love.graphics.newImage("Beachstorm.jpg")

	Nrml = Tile:new(love.graphics.newImage("Panels/General/Normal Panel.png"), true)
	MoBo = Tile:new(love.graphics.newImage("Panels/General/Movement Boost Panel.png"), false)
	DrwP = Tile:new(love.graphics.newImage("Panels/General/Draw Panel.png"), false)
	FuSa = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Sand-Full.png"), false)
	SULw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUL WaterBR.png"), false)
	SBLw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBL WaterUR.png"), false)
	SURw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUR WaterBL.png"), false)
	SBRw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBR WaterUL.png"), false)
	Wtrp = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water Panel.png"), false)
	WWUL = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUL.png"), false)
	WWUR = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUR.png"), false)
	WWBL = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBL.png"), false)
	WWBR = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBR.png"), false)
	Fllr = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Filler Panel.png"), false)

	--[[
	Nrml = love.graphics.newImage("Panels/General/Normal Panel.png")

	Mo-Bo = love.graphics.newImage("Panels/General/Movement Boost Panel.png")
	Dr-wP = love.graphics.newImage("Panels/General/Draw Panel.png")
	Fu-Sa = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Sand-Full.png")
	SU-Lw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUL WaterBR.png")
	SB-Lw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBL WaterUR.png")
	SU-Rw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUR WaterBL.png")
	SB-Rw = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBR WaterUL.png")
	Wt-rP = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water Panel.png")
	WW-UL = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUL.png")
	WW-UR = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUR.png")
	WW-BL = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBL.png")
	WW-BR = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBR.png")
	Fl-lr = love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Filler Panel.png")]]



	TileW, TileH = 60,60

	TileTable =
	{
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa) },
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa) },
     { FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),SULw:getImage(SULw),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa) },
     { Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr) },
     { DrwP:getImage(DrwP),FuSa:getImage(FuSa),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),MoBo:getImage(MoBo),Nrml:getImage(Nrml),MoBo:getImage(MoBo),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Nrml:getImage(Nrml) },
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Fllr:getImage(Fllr),DrwP:getImage(DrwP) },
     { Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr) },
     { FuSa:getImage(FuSa),Fllr:getImage(Fllr),MoBo:getImage(MoBo),Fllr:getImage(Fllr),SBLw:getImage(SBLw),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),SBRw:getImage(SBRw),Fllr:getImage(Fllr),MoBo:getImage(MoBo),Fllr:getImage(Fllr),FuSa:getImage(FuSa) },
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa) },
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa) }
	}
	--font1 = love.graphics.setNewFont("Fonts/Brushaff.otf", 64)
	font1 = love.graphics.setNewFont("Brushaff.otf",64)
end

function s.draw()
	--love.graphics.draw(BG, love.graphics.getWidth()/2 - 450, love.graphics.getHeight()/2 - 450)
	for rowIndex=1, #TileTable do
		local row = TileTable[rowIndex]
		for columnIndex=1, #row do
			local identifier = row[columnIndex]
			local x = love.graphics.getWidth()/2 - 450 + (columnIndex-1)*TileW
			local y = love.graphics.getHeight()/2 - 450 + (rowIndex-1)*TileH
			love.graphics.draw(identifier, x, y)
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
