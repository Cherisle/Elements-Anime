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
	PlayerGUIs[1] = PlayerGUI:new(50,50,250,250,Players[1]:getLabel(Players[1]), Players[1])
	PlayerGUIs[2] = PlayerGUI:new(love.graphics.getWidth() - 300,50,250,250,Players[2]:getLabel(Players[2]), Players[2])
	PlayerGUIs[3] = PlayerGUI:new(50,350,250,250,Players[3]:getLabel(Players[3]), Players[3])
	PlayerGUIs[4] = PlayerGUI:new(love.graphics.getWidth() - 300,350,250,250,Players[4]:getLabel(Players[4]), Players[4])
	PlayerGUIs[5] = PlayerGUI:new(50,650,250,250,Players[5]:getLabel(Players[5]), Players[5])
	PlayerGUIs[6] = PlayerGUI:new(love.graphics.getWidth() - 300,650,250,250,Players[6]:getLabel(Players[6]), Players[6])
	--BG = love.graphics.newImage("Beachstorm.jpg")



	Nrml = Tile:new(love.graphics.newImage("Panels/General/Normal Panel.png"), true, "Nrml")
	MoBo = Tile:new(love.graphics.newImage("Panels/General/Movement Boost Panel.png"), false, "MoBo")
	DrwP = Tile:new(love.graphics.newImage("Panels/General/Draw Panel.png"), false, "DrwP")
	FuSa = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Sand-Full.png"), false, "FuSa")
	SULw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUL WaterBR.png"), false, "SULw")
	SBLw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBL WaterUR.png"), false, "SBLw")
	SURw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandUR WaterBL.png"), false, "SURw")
	SBRw = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/SandBR WaterUL.png"), false, "SBRw")
	Wtrp = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water Panel.png"), false, "Wtrp")
	WWUL = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUL.png"), false, "WWUL")
	WWUR = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveUR.png"), false, "WWUR")
	WWBL = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBL.png"), false, "WWBL")
	WWBR = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Water WaveBR.png"), false, "WWBR")
	Fllr = Tile:new(love.graphics.newImage("Panels/Inactive/Map 1 - Theta's Paradise/Filler Panel.png"), false, "Fllr")

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

	tileLocCounter = {n = 14}
	for i = 1, 14, 1 do
		tileLocCounter[i] = 0;
	end

	--Sets the positions of all the tile object based on the TileTable
	for rowIndex=1, #TileTable do
		local row = TileTable[rowIndex]
		for columnIndex=1, #row do
			local identifier = row[columnIndex]
			local x = love.graphics.getWidth()/2 - 450 + (columnIndex-1)*TileW
			local y = love.graphics.getHeight()/2 - 450 + (rowIndex-1)*TileH

			if (identifier == Nrml:getImage(Nrml)) then
				tileLocCounter[1] = tileLocCounter[1] + 1
				Nrml:setTileLoc(Nrml, tileLocCounter[1],x,y)

			elseif (identifier == MoBo:getImage(MoBo)) then
				tileLocCounter[2] = tileLocCounter[2] + 1
				MoBo:setTileLoc(MoBo, tileLocCounter[2],x,y)

			elseif (identifier == DrwP:getImage(DrwP)) then
				tileLocCounter[3] = tileLocCounter[3] + 1
				DrwP:setTileLoc(DrwP, tileLocCounter[3],x,y)

			elseif (identifier == FuSa:getImage(FuSa)) then
				tileLocCounter[4] = tileLocCounter[4] + 1
				FuSa:setTileLoc(FuSa, tileLocCounter[4],x,y)

			elseif (identifier == SULw:getImage(SULw)) then
				tileLocCounter[5] = tileLocCounter[5] + 1
				SULw:setTileLoc(SULw, tileLocCounter[5],x,y)

			elseif (identifier == SBLw:getImage(SBLw)) then
				tileLocCounter[6] = tileLocCounter[6] + 1
				SBLw:setTileLoc(SBLw, tileLocCounter[6],x,y)

			elseif (identifier == SURw:getImage(SURw)) then
				tileLocCounter[7] = tileLocCounter[7] + 1
				SURw:setTileLoc(SURw, tileLocCounter[7],x,y)

			elseif (identifier == SBRw:getImage(SBRw)) then
				tileLocCounter[8] = tileLocCounter[8] + 1
				SBRw:setTileLoc(SBRw, tileLocCounter[8],x,y)

			elseif (identifier == Wtrp:getImage(Wtrp)) then
				tileLocCounter[9] = tileLocCounter[9] + 1
				Wtrp:setTileLoc(Wtrp, tileLocCounter[9],x,y)

			elseif (identifier == WWUL:getImage(WWUL)) then
				tileLocCounter[10] = tileLocCounter[10] + 1
				WWUL:setTileLoc(WWUL, tileLocCounter[10],x,y)

			elseif (identifier == WWUR:getImage(WWUR)) then
				tileLocCounter[11] = tileLocCounter[11] + 1
				WWUR:setTileLoc(WWUR, tileLocCounter[11],x,y)

			elseif (identifier == WWBL:getImage(WWBL)) then
				tileLocCounter[12] = tileLocCounter[12] + 1
				WWBL:setTileLoc(WWBL, tileLocCounter[12],x,y)

			elseif (identifier == WWBR:getImage(WWBR)) then
				tileLocCounter[13] = tileLocCounter[13] + 1
				WWBR:setTileLoc(WWBR, tileLocCounter[13],x,y)

			elseif (identifier == Fllr:getImage(Fllr)) then
				tileLocCounter[14] = tileLocCounter[14] + 1
				Fllr:setTileLoc(Fllr, tileLocCounter[14],x,y)
			end

		end

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


	PlayerGUIs[1]:drawPlayer(PlayerGUIs[1])
	PlayerGUIs[2]:drawPlayer(PlayerGUIs[2])
	PlayerGUIs[3]:drawPlayer(PlayerGUIs[3])
	PlayerGUIs[4]:drawPlayer(PlayerGUIs[4])
	PlayerGUIs[5]:drawPlayer(PlayerGUIs[5])
	PlayerGUIs[6]:drawPlayer(PlayerGUIs[6])

	PlayerGUIs[1]:isHovered(PlayerGUIs[1],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[2]:isHovered(PlayerGUIs[2],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[3]:isHovered(PlayerGUIs[3],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[4]:isHovered(PlayerGUIs[4],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[5]:isHovered(PlayerGUIs[5],love.mouse.getX(),love.mouse.getY())
	PlayerGUIs[6]:isHovered(PlayerGUIs[6],love.mouse.getX(),love.mouse.getY())


	--[[Nrml:isHovered(Nrml,love.mouse.getX(),love.mouse.getY())
	MoBo:isHovered(MoBo,love.mouse.getX(),love.mouse.getY())
	DrwP:isHovered(DrwP,love.mouse.getX(),love.mouse.getY())
	FuSa:isHovered(FuSa,love.mouse.getX(),love.mouse.getY())
	SULw:isHovered(SULw,love.mouse.getX(),love.mouse.getY())
	SBLw:isHovered(SBLw,love.mouse.getX(),love.mouse.getY())
	SURw:isHovered(SURw,love.mouse.getX(),love.mouse.getY())
	SBRw:isHovered(SBRw,love.mouse.getX(),love.mouse.getY())
	Wtrp:isHovered(Wtrp,love.mouse.getX(),love.mouse.getY())
	WWUL:isHovered(WWUL,love.mouse.getX(),love.mouse.getY())
	WWUR:isHovered(WWUR,love.mouse.getX(),love.mouse.getY())
	WWBL:isHovered(WWBL,love.mouse.getX(),love.mouse.getY())
	WWBR:isHovered(WWBR,love.mouse.getX(),love.mouse.getY())
	Fllr:isHovered(Fllr,love.mouse.getX(),love.mouse.getY()) ]]

end

function s.update(dt)
	collectgarbage()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		Nrml:clikedEvent(Nrml, love.mouse.getX(), love.mouse.getY())
		DrwP:clikedEvent(DrwP,love.mouse.getX(),love.mouse.getY())
		FuSa:clikedEvent(FuSa,love.mouse.getX(),love.mouse.getY())
		SULw:clikedEvent(SULw,love.mouse.getX(),love.mouse.getY())
		SBLw:clikedEvent(SBLw,love.mouse.getX(),love.mouse.getY())
		SURw:clikedEvent(SURw,love.mouse.getX(),love.mouse.getY())
		SBRw:clikedEvent(SBRw,love.mouse.getX(),love.mouse.getY())
		Wtrp:clikedEvent(Wtrp,love.mouse.getX(),love.mouse.getY())
		WWUL:clikedEvent(WWUL,love.mouse.getX(),love.mouse.getY())
		WWUR:clikedEvent(WWUR,love.mouse.getX(),love.mouse.getY())
		WWBL:clikedEvent(WWBL,love.mouse.getX(),love.mouse.getY())
		WWBR:clikedEvent(WWBR,love.mouse.getX(),love.mouse.getY())
		Fllr:clikedEvent(Fllr,love.mouse.getX(),love.mouse.getY())
	else if button == 2 then
		scenery.load("MainMenu")
    end
	end
end
end
