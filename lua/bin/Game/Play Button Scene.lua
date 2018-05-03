require "scenery"
ui = require "loveui/ui"
mainScript = require "main"
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
	PlayerGUIs[1] = PlayerGUI:new(50,50,250,250,Players[1]:getLabel(Players[1]), Players[1], 255, 0, 0)
	PlayerGUIs[2] = PlayerGUI:new(love.graphics.getWidth() - 300,50,250,250,Players[2]:getLabel(Players[2]), Players[2], 74, 134, 232)
	PlayerGUIs[3] = PlayerGUI:new(50,350,250,250,Players[3]:getLabel(Players[3]), Players[3], 106, 168, 79)
	PlayerGUIs[4] = PlayerGUI:new(love.graphics.getWidth() - 300,350,250,250,Players[4]:getLabel(Players[4]), Players[4], 255, 217, 102)
	PlayerGUIs[5] = PlayerGUI:new(50,650,250,250,Players[5]:getLabel(Players[5]), Players[5], 145, 0, 255)
	PlayerGUIs[6] = PlayerGUI:new(love.graphics.getWidth() - 300,650,250,250,Players[6]:getLabel(Players[6]), Players[6], 255, 255, 255)



	Nrml = Tile:new(love.graphics.newImage("Panels/General/Normal Panel.png"), true, "Nrml")
	MoBo = Tile:new(love.graphics.newImage("Panels/General/Movement Boost Panel.png"), true, "MoBo")
	DrwP = Tile:new(love.graphics.newImage("Panels/General/Draw Panel.png"), true, "DrwP")
	Hom1 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 1 - Hom1.png"), true, "Hom1")
	Hom2 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 2 - Hom2.png"), true, "Hom2")
	Hom3 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 3 - Hom3.png"), true, "Hom3")
	Hom4 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 4 - Hom4.png"), true, "Hom4")
	Hom5 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 5 - Hom5.png"), true, "Hom5")
	Hom6 = Tile:new(love.graphics.newImage("Panels/General/Home Panel 6 - Hom6.png"), true, "Hom6")
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

	TileW, TileH = 60,60
	-- FIXED 

	TileTable =
	{
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Hom5:getImage(Hom5),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa) }, -- 1
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa) }, -- 2
     { FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),SULw:getImage(SULw),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa) }, -- 3
     { Fllr:getImage(Fllr),Nrml:getImage(Nrml),FuSa:getImage(FuSa),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr) }, -- 4
     { DrwP:getImage(DrwP),FuSa:getImage(FuSa),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Fllr:getImage(Fllr),Nrml:getImage(Nrml) }, -- 5
     { Hom4:getImage(Hom4),SULw:getImage(SULw),WWUL:getImage(WWUL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWUR:getImage(WWUR),SURw:getImage(SURw),Nrml:getImage(Nrml) }, -- 6
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Nrml:getImage(Nrml) }, -- 7
     { Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Hom6:getImage(Hom6),MoBo:getImage(MoBo),Nrml:getImage(Nrml),MoBo:getImage(MoBo),Hom1:getImage(Hom1),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml) }, -- 8
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Fllr:getImage(Fllr),Hom2:getImage(Hom2) }, -- 9
     { Nrml:getImage(Nrml),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Nrml:getImage(Nrml) }, -- 10
     { Nrml:getImage(Nrml),Fllr:getImage(Fllr),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Fllr:getImage(Fllr),DrwP:getImage(DrwP) }, -- 11
     { Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),SBLw:getImage(SBLw),WWBL:getImage(WWBL),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),WWBR:getImage(WWBR),SBRw:getImage(SBRw),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr) }, -- 12
     { FuSa:getImage(FuSa),Fllr:getImage(Fllr),MoBo:getImage(MoBo),Fllr:getImage(Fllr),SBLw:getImage(SBLw),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),Wtrp:getImage(Wtrp),SBRw:getImage(SBRw),Fllr:getImage(Fllr),MoBo:getImage(MoBo),Fllr:getImage(Fllr),FuSa:getImage(FuSa) }, -- 13
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa) }, -- 14
     { FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa),Fllr:getImage(Fllr),Nrml:getImage(Nrml),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Hom3:getImage(Hom3),DrwP:getImage(DrwP),Nrml:getImage(Nrml),Nrml:getImage(Nrml),Fllr:getImage(Fllr),FuSa:getImage(FuSa),FuSa:getImage(FuSa),FuSa:getImage(FuSa) } -- 15
	}

	tileLocCounter = {n = 20}
	for i = 1, 20, 1 do
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
				Nrml:addToTileMaps(Nrml,x,y)

			elseif (identifier == MoBo:getImage(MoBo)) then
				tileLocCounter[2] = tileLocCounter[2] + 1
				MoBo:setTileLoc(MoBo, tileLocCounter[2],x,y)
				MoBo:addToTileMaps(MoBo,x,y)

			elseif (identifier == DrwP:getImage(DrwP)) then
				tileLocCounter[3] = tileLocCounter[3] + 1
				DrwP:setTileLoc(DrwP, tileLocCounter[3],x,y)
				DrwP:addToTileMaps(DrwP,x,y)

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

			elseif (identifier == Hom1:getImage(Hom1)) then
				tileLocCounter[15] = tileLocCounter[15] + 1
				Hom1:setTileLoc(Hom1, tileLocCounter[15],x,y)
				Hom1:addToTileMaps(Hom1,x,y)
				Hom1:addPlayer(Hom1, 1, PlayerGUIs[1])

			elseif (identifier == Hom2:getImage(Hom2)) then
				tileLocCounter[16] = tileLocCounter[16] + 1
				Hom2:setTileLoc(Hom2, tileLocCounter[16],x,y)
				Hom2:addToTileMaps(Hom2,x,y)
				Hom2:addPlayer(Hom2, 1, PlayerGUIs[2])

			elseif (identifier == Hom3:getImage(Hom3)) then
				tileLocCounter[17] = tileLocCounter[17] + 1
				Hom3:setTileLoc(Hom3, tileLocCounter[17],x,y)
				Hom3:addToTileMaps(Hom3,x,y)
				Hom3:addPlayer(Hom3, 1, PlayerGUIs[3])

			elseif (identifier == Hom4:getImage(Hom4)) then
				tileLocCounter[18] = tileLocCounter[18] + 1
				Hom4:setTileLoc(Hom4, tileLocCounter[18],x,y)
				Hom4:addToTileMaps(Hom4,x,y)
				Hom4:addPlayer(Hom4, 1, PlayerGUIs[4])

			elseif (identifier == Hom5:getImage(Hom5)) then
				tileLocCounter[19] = tileLocCounter[19] + 1
				Hom5:setTileLoc(Hom5, tileLocCounter[19],x,y)
				Hom5:addToTileMaps(Hom5,x,y)
				Hom5:addPlayer(Hom5, 1, PlayerGUIs[5])

			elseif (identifier == Hom6:getImage(Hom6)) then
				tileLocCounter[20] = tileLocCounter[20] + 1
				Hom6:setTileLoc(Hom6, tileLocCounter[20],x,y)
				Hom6:addToTileMaps(Hom6,x,y)
				Hom6:addPlayer(Hom6, 1, PlayerGUIs[6])
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

	--PlayerGUIs[1]:isHovered(PlayerGUIs[1],love.mouse.getX(),love.mouse.getY())
--	PlayerGUIs[2]:isHovered(PlayerGUIs[2],love.mouse.getX(),love.mouse.getY())
--	PlayerGUIs[3]:isHovered(PlayerGUIs[3],love.mouse.getX(),love.mouse.getY())
--	PlayerGUIs[4]:isHovered(PlayerGUIs[4],love.mouse.getX(),love.mouse.getY())
--	PlayerGUIs[5]:isHovered(PlayerGUIs[5],love.mouse.getX(),love.mouse.getY())
--	PlayerGUIs[6]:isHovered(PlayerGUIs[6],love.mouse.getX(),love.mouse.getY())

	Nrml:drawPlayerOnTile(Nrml)
	DrwP:drawPlayerOnTile(DrwP)
	MoBo:drawPlayerOnTile(MoBo)
	Hom1:drawPlayerOnTile(Hom1)
	Hom2:drawPlayerOnTile(Hom2)
	Hom3:drawPlayerOnTile(Hom3)
	Hom4:drawPlayerOnTile(Hom4)
	Hom5:drawPlayerOnTile(Hom5)
	Hom6:drawPlayerOnTile(Hom6)



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
	choose = false
	if button == 1 then
		Nrml:clikedEvent(Nrml, love.mouse.getX(), love.mouse.getY())
		DrwP:clikedEvent(DrwP,love.mouse.getX(),love.mouse.getY())
		MoBo:clikedEvent(MoBo,love.mouse.getX(),love.mouse.getY())
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
		Hom1:clikedEvent(Hom1,love.mouse.getX(),love.mouse.getY())
		Hom2:clikedEvent(Hom2,love.mouse.getX(),love.mouse.getY())
		Hom3:clikedEvent(Hom3,love.mouse.getX(),love.mouse.getY())
		Hom4:clikedEvent(Hom4,love.mouse.getX(),love.mouse.getY())
		Hom5:clikedEvent(Hom5,love.mouse.getX(),love.mouse.getY())
		Hom6:clikedEvent(Hom6,love.mouse.getX(),love.mouse.getY())
	if button == 2 then
		_G.counter = 2
		scenery.load("MainMenu")
    end
end

		for i = 1,6,1 do
			PlayerGUIs[i]:addHP(PlayerGUIs[i])
			PlayerGUIs[i]:subtractHP(PlayerGUIs[i])
			PlayerGUIs[i]:addAP(PlayerGUIs[i])
			PlayerGUIs[i]:subtractAP(PlayerGUIs[i])
			choose = PlayerGUIs[i]:moveEvent(PlayerGUIs[i])
			end

	else if button == 2 then
		scenery.load("MainMenu")
    	end
		end

	end
end
